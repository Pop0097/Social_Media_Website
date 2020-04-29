class UsersController < ApplicationController

  before_action :authenticate_user! #User must be logged in before accessing view files in User class.
  before_action :set_previous_user, only: [:followers, :following]
  before_action :set_user, except: [:index, :search] #sets @user before calling other methods

  def index
    @users = User.paginate(:page => params[:page], per_page: 50) #paginates the results so only 30 users appear on the page at a time
    $page_before_viewing_user = 5
  end

  def show
    @posts = @user.posts.order(created_at: :desc).paginate(:page => params[:page], per_page: 20) #paginates the explore page so only 20 post are shown at a time
    if $page_before_viewing_user != 2
      $page_before_viewing_post = 2
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy

    redirect_to root_path
  end

  def followers
    @followers = @user.followers
    $page_before_viewing_user = 3
  end

  def following
    @following = @user.following
    $page_before_viewing_user = 4
  end

  def search
    @users = User.where("username LIKE ?", "%" + params[:q] + "%").paginate(:page => params[:page], per_page: 50)  #finds users that have string "q" in their username. Also, paginates the results so only 30 users appear on the page at a time
    @search = params[:q]
    $page_before_viewing_user = 0
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def set_previous_user
      $previous_user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :sex, :username, :birth_year, :birth_month, :avatar)
    end

end
