class UsersController < ApplicationController

  before_action :authenticate_user! #User must be logged in before accessing view files in User class.
  before_action :set_user #sets @user before calling other methods

  def show
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

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :sex, :username, :birth_year, :birth_month, :avatar)
    end

end
