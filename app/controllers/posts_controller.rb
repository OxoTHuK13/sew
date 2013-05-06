class PostsController < ApplicationController
	# before_filter :check_if_admin
	before_filter :admin_user, only: [:new, :create, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(params[:post])
		redirect_to action: :show, id: @post.id
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(params[:post])
			redirect_to action: :show, id: @post.id
		else
			render "edit"
		end
	end

	def destroy
		@post =Post.find(params[:id])
		@post.destroy
		redirect_to action: :index
	end

	# private

	# 	def check_if_admin
	# 		@admin = 1 if params[:admin] =="ali"
	# 	end
end
