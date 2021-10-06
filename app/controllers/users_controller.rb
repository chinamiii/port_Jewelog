class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.post.page(params[:posts_page]).per(4)
    @favorites = @user.favorites.page(params[:favorites_page]).per(4)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "変更が完了しました。"
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
