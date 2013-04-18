class UserController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :refresh_mosts
  helper_method :user

  def most
  end

  def refresh_mosts
    respond_to do |format|
      if user.update_mosts(params[:most])
        format.json { head :no_content }
      else
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user
    @user ||= User.find_by_screen_name(params[:screen_name])
  end
end
