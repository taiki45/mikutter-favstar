class AddMostNumberToTweet < ActiveRecord::Migration
  def change
    change_table :tweets do |t|
      t.integer :most_number
    end
  end
end
