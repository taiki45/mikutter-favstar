class FixUsersNulls < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :twitter_id, :integer, null: false
      t.change :name, :string, null: false
      t.change :screen_name, :string, null: false
      t.change :oauth_token, :string, null: false
      t.change :oauth_secret, :string, null: false
      t.change :profile_image_url, :text, null: false
    end
  end

  def down
    change_table :users do |t|
      t.change :twitter_id, :integer, null: true
      t.change :name, :string, null: true
      t.change :screen_name, :string, null: true
      t.change :oauth_token, :string, null: true
      t.change :oauth_secret, :string, null: true
      t.change :profile_image_url, :text, null: true
    end
  end
end
