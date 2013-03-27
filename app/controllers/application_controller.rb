class ApplicationController < ActionController::Base
  protect_from_forgery

  def login?
    session[:id]
  end

  def require_login
    redirect_to controller: 'home', action: 'index' unless login?
  end
end
