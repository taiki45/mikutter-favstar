class Tweet < ActiveRecord::Base
  attr_accessible :tweet_id, :most_number

  belongs_to :user
end
