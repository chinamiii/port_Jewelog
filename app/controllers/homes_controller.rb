class HomesController < ApplicationController
  def top
  end

  def about
  end

  def search
    @posts = Post.where(item: "ピアス").where(item: "ブレスレット")
  end
end
