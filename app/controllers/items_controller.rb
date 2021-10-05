class ItemsController < ApplicationController
  def index
    @posts = Post.where(item_id: @item.id).page(params[:page]).per(8)
    @items = .all
  end
end
