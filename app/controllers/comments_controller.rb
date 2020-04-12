class CommentsController < ApplicationController

  before_action :authenticate_user! #User must be logged in before accessing view files in User class.
  before_action :set_post #sets @post before calling other methods

  def create
    @comment = @post.comments.create(comment_params)

    redirect_to post_path(@post) #redirects back to the post that the user was currently viewing
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end

  private 
    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      #ensures that the correct values are being inputed and validates them based on the criteria in comment.rb
      params.require(:comment).permit(:commenter, :body)
    end

end
