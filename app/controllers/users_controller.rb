class UsersController < ApplicationController

  before_action :authenticate_user! #User must be logged in before accessing view files in User class.
  before_action :set_user, except: [:index, :search] #sets @user before calling other methods

  def index
    @users = User.paginate(:page => params[:page], per_page: 30) #paginates the results so only 30 users appear on the page at a time
  end

  def show
    @posts = @user.posts.paginate(:page => params[:page], per_page: 20) #paginates the explore page so only 20 post are shown at a time
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
  end

  def following
    @following = @user.following
  end

  def search
    @users = User.where("username LIKE ?", "%" + params[:q] + "%").paginate(:page => params[:page], per_page: 30)  #finds users that have string "q" in their username. Also, paginates the results so only 30 users appear on the page at a time
    @search = params[:q]
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :sex, :username, :birth_year, :birth_month, :avatar)
    end

end
