class HomesController < ApplicationController
  def top
  @posts = Post.where(item: ['ピアス', 'リング', 'ネックレス', 'ブレスレット'])
  end

  def about
  end


  def search
  @posts = Post.where(item: params[:item]).where(material: params[:material]).where(jewel: params[:jewel]).page(params[:posts_page]).per(16)
  render 'homes/item'
  end

  def material
  @posts = Post.where(material: params[:material]).or(Post.where(jewel: params[:jewel])).page(params[:posts_page]).per(16)
  render 'homes/material'
  end




end
