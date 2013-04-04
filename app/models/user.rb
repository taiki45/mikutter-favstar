class User < ActiveRecord::Base
  attr_accessible :name, :oauth_secret, :oauth_token
  attr_accessible :profile_image_url, :screen_name, :twitter_id, :updated_at

  has_many :tweets, dependent: :destroy, order: :most_number

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

  def update_mosts(new_mosts)
    tweets = JSON.parse(new_mosts).map do |most|
      Tweet.new(tweet_id: most[:id], most_number: most[:number])
    end
    save
  end
end
