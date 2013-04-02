class RecreateTweetTable < ActiveRecord::Migration
  def up
    create_table :tweets do |t|
      t.integer :tweet_id, null: false
      t.integer :most_number, null: false
      t.references :user
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
  end

  def down
    drop_table :tweets
  end
end
