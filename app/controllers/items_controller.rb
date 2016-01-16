class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = current_list.items.create(item_params)
    redirect_to list_path(current_list)
  end

  private

  def item_params
    params.require(:item).permit(:task)
  end

  helper_method :current_list
  def current_list
    @current_list ||= List.find(params[:list_id])
  end
end
