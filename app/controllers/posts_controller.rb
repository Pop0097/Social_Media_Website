class PostsController < ApplicationController

  before_action :authenticate_user! #User must be logged in before accessing view files in User class.
  before_action :set_post, only: [:show, :edit, :update, :destroy] #sets @post before calling other methods

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      #ensures that the correct values are being inputed and validates them based on the criteria in post.rb
      params.require(:post).permit(:title, :body, :post_file)
    end
end
