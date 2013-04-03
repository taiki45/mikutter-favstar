class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper

  def require_login
    redirect_to controller: 'home', action: 'index' unless login?
  end
end
