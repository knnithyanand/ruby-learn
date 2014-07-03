class HomeController < ApplicationController
  skip_authorization_check
  
  def index
    if current_user and !current_user.profile
      redirect_to new_profile_path
    end
  end
end
