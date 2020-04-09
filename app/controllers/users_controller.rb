class UsersController < ApplicationController

  before_action :authenticate_user!

  #MADE FOR TESTING PURPOSES. WILL DELETE LATER

  def show
    @user = User.find_by_email(params[:id])
  end

end
