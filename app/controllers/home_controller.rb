class HomeController < ApplicationController
  before_filter :require_login, except: :index

  def index
  end

  def home
  end
end
