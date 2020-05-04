class PostsController < ApplicationController

  before_action :authenticate_user! #User must be logged in before accessing view files in User class.
  before_action :set_previous_post, only: [:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy] #sets @post before calling other methods

  def index
    @following = current_user.following
    @postarray = Array.new #creates an array that will hold the posts of the current user and the users they follow
    @posts = Post.all.order(created_at: :desc)
    @posts.each do |post| #searches all posts
      if current_user.following?(post.user) or post.user == current_user
        @postarray << post #adds posts to array
      end
    end
    @postarray = @postarray.paginate(:page => params[:page], :per_page => 20) #paginates the page so only 20 post are shown at a time
    $page_before_viewing_post = 1
    $page_before_viewing_user = 1
  end

  def explore
    @following = current_user.following
    @postarray = Array.new #creates an array that will hold the posts of the users the current_user does not follopw
    @posts = Post.all.order(created_at: :desc)
    @posts.each do |post| #searches all posts
      if !current_user.following?(post.user) and post.user != current_user
        @postarray << post #adds posts to array
      end
    end
    @postarray = @postarray.paginate(:page => params[:page], :per_page => 20) #paginates the page so only 20 post are shown at a time    $page_before_viewing_post = 0
    $page_before_viewing_post = 0
    $page_before_viewing_user = 0
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
    $page_before_viewing_user = 2
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

    def set_previous_post
      $previous_post = Post.find(params[:id])
    end

    def post_params
      #ensures that the correct values are being inputed and validates them based on the criteria in post.rb
      params.require(:post).permit(:title, :body, :post_file)
    end
end
