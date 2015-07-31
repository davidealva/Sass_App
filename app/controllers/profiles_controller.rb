class ProfilesController < ApplicationController

	def new
		# form for user to fill out new profile
		@user = User.find(params[:user_id])
		@profile = Profile.new
	end

	def create
		@user = User.find(params[:user_id])
		@profile = @user.build_profile(profile_params)
		if @profile.save
			flash[:success] = "Your profile has been created"
			redirect_to user_path(params[:user_id])
		else
			render action: :new 
		end
	end

	private

		def profile_params
			params.require(:profile).permit(:first_name, :last_name, :title, :phone_number, :contact_email, :description)
		end

end