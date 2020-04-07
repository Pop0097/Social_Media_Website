class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.order(created_at: :desc) #lists all posts in descending order
  end

  def new
    @post = current_user.posts.build
  end

  def create
    #render plain: params[:post].inspect #tests to see if the post object is created
    @post = current_user.posts.build(post_params)


    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  private def post_params
    params.require(:post).permit(:title, :body)
  end
end
