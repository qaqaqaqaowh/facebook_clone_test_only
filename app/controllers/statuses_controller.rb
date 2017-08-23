class StatusesController < ApplicationController
	def new
		@status = Status.new
	end

	def edit
		@status = Status.new
	end

	def create
		@status = Status.new(title: params[:status][:title], content: params[:status][:content])
		if @status.save
			flash[:notice] = "Status is created successfully."
			redirect_to @status
		else
			flash[:alert] = "Error creating status."
			render "new"
		end
	end

	def update
		@status = Status.find(params[:id])
		if @status.update(title: params[:status][:title], content: params[:status][:content])
			flash[:notice] = "Status is updated successfully."
			redirect_to @status
		else
			render "edit"
		end
	end

	def destroy
		@status = Status.find(params[:id])
		@status.destroy
		flash[:notice] = "Status is deleted."
		redirect_to statuses_path
	end
end
