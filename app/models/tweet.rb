class Tweet < ActiveRecord::Base
  attr_accessible :tweet_id, :most_number

  belongs_to :user

  validates :tweet_id, presence: true, uniqueness: true
  validates :most_number, presence: true
end
