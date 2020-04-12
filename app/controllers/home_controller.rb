class HomeController < ApplicationController
  def index
    if current_user.present? #if user is present, user is redirected to the main page (index.html.erb in ~/posts)
      redirect_to "http://localhost:3000/posts"
    end
  end
end
