class ApplicationController < ActionController::Base
  protect_from_forgery

  def login?
    session[:id] && current_user
  end

  def current_user
    @current_user ||= User.find(session[:id])
  end

  def require_login
    redirect_to controller: 'home', action: 'index' unless login?
  end
end
