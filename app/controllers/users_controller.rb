class UsersController < ApplicationController

  before_action :authenticate_user! #User must be logged in before accessing view files in User class.
  before_action :set_user, except: [:index, :search] #sets @user before calling other methods

  def index
    @users = User.all
  end

  def show
    @counter = 1;
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
    @users = User.where("username LIKE ?", "%" + params[:q] + "%") #finds users that have string "q" in their username
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
