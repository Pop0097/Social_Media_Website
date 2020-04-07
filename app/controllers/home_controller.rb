class HomeController < ApplicationController
  def index
    if current_user.present?
      redirect_to "http://localhost:3000/posts"
    end
  end
end
