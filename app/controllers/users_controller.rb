class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(email: params[:user][:email], name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
		if @user.save
			flash[:notice] = "Account created. Please log in now."
			redirect_to @user
		else
			flash[:alert] = "Error creating account: "
			render 'new'
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(email: params[:user][:email], name: params[:user][:name], password: params[:user][:password],password_confirmation: params[:user][:password_confirmation])
			flash[:notice] = "Account is updated successfully."
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		flash[:notice] = "Account is deleted"
		redirect_to statuses_path
	end
end