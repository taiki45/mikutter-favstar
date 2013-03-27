module ApplicationHelper
  def login?
    session[:id]
  end

  def user
    User.find(session[:id])
  end
end
