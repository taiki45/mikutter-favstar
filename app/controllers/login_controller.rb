class LoginController < ApplicationController
  def login
    base_url = "#{request.scheme}://#{request.host_with_port}"
    client = TwitterOAuth::Client.new(consumers)
    request_token = client.authentication_request_token(oauth_callback: base_url + '/callback')

    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret

    redirect_to request_token.authorize_url
  end

  def callback
    client = TwitterOAuth::Client.new(consumers)
    access_token = client.authorize(
      session[:request_token],
      session[:request_token_secret],
      :oauth_verifier => params[:oauth_verifier]
    )

    info = client.info
    user = User.find_by_twitter_id(info['id'])
    user = User.create_from(client, info) unless user

    session[:request_token] = nil
    session[:request_token_secret] = nil
    session[:id] = user.id

    redirect_to controller: :user, action: :most, screen_name: user.screen_name
  end

  def logout
    reset_session
    redirect_to controller: :home, action: :index
  end

  def debug
    session[:id] = 1
    redirect_to controller: :home, action: :home
  end

  private

  def consumers
    {
      consumer_key: MikutterFavstar::Application.config.consumer_key,
      consumer_secret: MikutterFavstar::Application.config.consumer_secret
    }
  end
end
