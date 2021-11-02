class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.score = Language.get_data(post_params[:caption])
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def index
    @posts = Post.all.order(params[:sort]).page(params[:posts_page]).per(16)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.score = Language.get_data(post_params[:caption])
    if params[:post][:post_image_ids]
      params[:post][:post_image_ids].each do |post_image_id|
        post_image = @post.post_images.find(post_image_id)
        post_image.purge
      end
    end

    if @post.update(post_params)
      flash[:notice] = "変更が完了しました。"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    @posts = Post.search(params[:keyword]).page(params[:posts_page]).per(16)
    @keyword = params[:keyword]
    render 'homes/material'
  end

  private

  def post_params
    params.require(:post).permit(:title, :caption, :rate, :jewel, :price, :item, :material, :shop_name, post_images: [])
  end
end
