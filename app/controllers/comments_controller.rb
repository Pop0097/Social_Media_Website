class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.create(comment_params)
    @person = current_user

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private def set_post
    @post = Post.find(params[:post_id])
  end

  private def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
