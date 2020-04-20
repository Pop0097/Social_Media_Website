class LikesController < ApplicationController

  before_action :set_post #sets @post before calling other methods
  before_action :set_like, only: [:destroy] #sets @like before calling the destroy method

  def create
    if !(already_liked?) #if the post is not already liked by the user, a like can be created
      @post.likes.create(user_id: current_user.id)
    end

    redirect_back(fallback_location: root_path)
  end

  def destroy
    if already_liked? #if user has already liked the post, they can remove their like
      @like.destroy
    end

    redirect_back(fallback_location: root_path)
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_like
      @like = @post.likes.find(params[:id])
    end

    def already_liked? #checks if user has already liked the post
      Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
    end
end
