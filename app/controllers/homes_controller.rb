class HomesController < ApplicationController
  def top
  @posts = Post.where(item: ['ピアス', 'リング', 'ネックレス', 'ブレスレット'])
  end

  def about
  end


  def search
  @posts = Post.where(item: params[:item])
  render 'homes/item'
  end



end
