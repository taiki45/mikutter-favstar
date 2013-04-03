class UserController < ApplicationController
  before_filter :user

  def most
  end

  def refresh_mosts
    respond_to do |format|
      if user.update_mosts(params[:most])
        format.json { head :no_content }
      else
        format.json { render json: use.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user
    @user ||= User.find_by_screen_name(params[:screen_name])
  end
end
