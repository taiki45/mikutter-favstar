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

    uesr = User.find(:first, conditions: {twitter_id: client.info['id']})
    user = User.craete_from(client) unless user

    session[:request_token] = nil
    session[:request_token_secret] = nil
    session[:id] = user.id

    redirect_to controller: :home, action: :home
  end

  def logout
    reset_session
    redirect_to controller: :home, action: :index
  end

  private

  def consumers
    {
      consumer_key: MikutterFavstar::Application.config.consumer_key,
      consumer_secret: MikutterFavstar::Application.config.consumer_secret
    }
  end
end
