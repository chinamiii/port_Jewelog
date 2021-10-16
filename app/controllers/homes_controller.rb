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

  def material
  @posts = Post.where(material: params[:material]).or(Post.where(jewel: params[:jewel]))
  render 'homes/material'
  end




end
