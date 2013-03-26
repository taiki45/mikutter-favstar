class User < ActiveRecord::Base
  attr_accessible :name, :oauth_secret, :oauth_token, :profile_image_url, :screen_name, :twitter_id, :updated_at

  def self.create_from(client, info)
    create(
      oauth_token: client.__send__(:access_token).token,
      oauth_secret: client.__send__(:access_token).secret,
      twitter_id: info['id'],
      name: info['name'],
      screen_name: info['screen_name'],
      profile_image_url: info['profile_image_url']
    )
  end
end
