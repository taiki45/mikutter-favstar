class AddIndexToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.index :twitter_id, unique: true
      t.index :screen_name, unique: true
      t.string :send_key
    end
  end
end
