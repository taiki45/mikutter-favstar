class User < ActiveRecord::Base
  attr_accessible :name, :oauth_secret, :oauth_token, :profile_image_url, :screen_name, :twitter_id, :updated_at
end
