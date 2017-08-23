class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email])
		if @user && @user.authenticate(params[:session][:password]) && params[:session][:password] == params[:session][:password_confirmation]
			session[:user_id] = @user.id
			flash[:notice] = "Welcome, #{@user.email}!"
			redirect_to statuses_path
		else
			flash[:alert] = "Please log in again"
			render "new"
		end
	end

	def destroy
	   session[:user_id] = nil
	   redirect_to root_path
	end
end