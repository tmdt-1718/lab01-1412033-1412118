class SessionsController < ApplicationController
	def new

	end



	def create
		begin
			user = User.authenticate!(session_params)
			login(user)
			NotifierMailer.login_noti(user).deliver
			flash[:success] = "Login successfully."
			redirect_to about_index_path
		rescue ActiveRecord::RecordNotFound => e
			flash[:error] = "Wrong email or password."
			render :new
		end
	end

	def destroy
			logout

			redirect_to login_path
	end

	private
	def session_params
		params.require(:session).permit(:email, :password)
	end
end
