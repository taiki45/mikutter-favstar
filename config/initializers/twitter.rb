# Initilize Twitter configure
Twitter.configure do |config|
  config.consumer_key = MikutterFavstar::Application.config.consumer_key
  config.consumer_secret = MikutterFavstar::Application.config.consumer_secret
end
