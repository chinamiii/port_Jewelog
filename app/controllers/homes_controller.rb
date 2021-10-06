class HomesController < ApplicationController
  def top
  @posts = Post.where(item: ['ピアス', 'リング', 'ネックレス', 'ブレスレット'])
  end

  def about
  end

  def item
  @posts = Post.where(item: ['ピアス', 'リング', 'ネックレス', 'ブレスレット'])

  end



end
