module UserHelper
  def user
    @user ||= User.find_by_screen_name(params[:screen_name])
  end
end
