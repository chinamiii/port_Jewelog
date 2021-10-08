class ItemsController < ApplicationController
  def index
    #@posts = Post.where(item_id: @item.id).page(params[:page]).per(8)
    #@items = .all
   item = params[:item]
　 @posts = Post.where(item: @item)
　 @posts = Post.search(item)
  end
end
