class Tweets < ActiveRecord::Base
  attr_accessible :tweet_id

  belongs_to :user
end
