MikutterFavstar::Application.routes.draw do

  get "login" => "login#login"
  get "logout" => "login#logout"
  get "callback" => "login#callback"
  get "debug" => "login#debug"

  get "home" => "home#home"

  match ":screen_name", via: :get, to: "user#most"
  match ":screen_name/recent", to: "user#recent"
  match ":screen_name", via: :put, to: "user#refresh_mosts"

  root :to => "home#index"

end
