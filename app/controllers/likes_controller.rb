class LikesController < ApplicationController
	def create
		@status = Status.find(params[:like][:status])
		if @like = Like.find_by(user_id: params[:like][:user], status_id: params[:like][:status])
			flash[:alert] = "You liked before!"
			redirect_to root_path
		else
			@like = Like.new(user_id: params[:like][:user], status_id: params[:like][:status])
			if @like.save
				flash[:notice] = "You liked #{@status.title}!"
				redirect_to root_path
			end
		end
	end

	def destroy
		@like = Like.find(params[:id])
		@status = Status.find(@like.status_id)
		@like.destroy
		flash[:notice] = "You unlike."
		redirect_to @status
	end
end
