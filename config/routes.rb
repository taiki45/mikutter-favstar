MikutterFavstar::Application.routes.draw do

  get "login" => "login#login"
  get "logout" => "login#logout"
  get "callback" => "login#callback"

  get "home" => "home#home"

  match ":screen_name", to: "user#most"
  match ":screen_name/recent", to: "user#recent"

  root :to => "home#index"

end
