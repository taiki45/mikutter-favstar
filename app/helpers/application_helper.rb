module ApplicationHelper
  def login?
    session[:id] && current_user
  end

  def current_user
    @current_user ||= User.find(session[:id])
  end
end
