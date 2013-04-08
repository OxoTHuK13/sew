class ItemsController < ApplicationController

	def index
		unless params[:price]
			params[:price] = 0 
		else
			params[:price]
		end
		@items = Item.where("price >= ?", params[:price]).limit(params[:limit])
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(params[:item])
		if @item.save
			redirect_to action: :show, id: @item.id
		end
	end

	def show
		@item = Item.find(params[:id])
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update_attributes(params[:item])
			redirect_to action: :show, id: @item.id
		else
			render "edit"
		end
	end

	def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to action: :index
  end

end
