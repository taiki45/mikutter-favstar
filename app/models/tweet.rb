class Tweet < ActiveRecord::Base
  attr_accessible :tweet_id, :most_number

  belongs_to :user

  validates :tweet_id, presence: true, uniqueness: true
  validates :most_number, presence: true

  # Create if not exists
  # Update if given most number is fresh
  def self.create?(attr = {})
    raise ArgumentError unless attr[:tweet_id] || attr[:most_number]
    if res = find_by_tweet_id(attr[:tweet_id])
      res.most_number = attr[:most_number] unless res.most_number == attr[:most_number]
      res.save!
      res
    else
      create!(attr)
    end
  end
end
