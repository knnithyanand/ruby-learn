class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_profile
  check_authorization  if !(:devise_controller)

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
    ## this render call should be:
    # render file: "#{Rails.root}/public/403", formats: [:html], status: 403, layout: false
  end

	private
	def require_profile
    if current_user and !current_user.profile
    	flash[:info] = "Welcome! Let us know more about you."
      redirect_to new_profile_path
    end
  end

end
