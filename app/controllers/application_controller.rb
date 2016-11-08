class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user
    if !cookies[:user_id] || cookies[:user_id]==""
      redirect_to '/'
    end
  end
end
