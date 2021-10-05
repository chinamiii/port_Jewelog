class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = PostComment.new(post_comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    @comment.save


  end

  def destroy
    @post = Post.find(params[:post_id])
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy

  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
