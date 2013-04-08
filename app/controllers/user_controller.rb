class UserController < ApplicationController

  include UserHelper

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
end
