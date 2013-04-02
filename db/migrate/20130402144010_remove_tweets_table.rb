class RemoveTweetsTable < ActiveRecord::Migration
  def up
    drop_table :tweets
  end

  def down
    create_table "tweets", :force => true do |t|
      t.integer  "tweet_id"
      t.datetime "created_at",  :null => false
      t.datetime "updated_at",  :null => false
      t.integer  "most_number"
    end
  end
end
