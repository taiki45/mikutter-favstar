class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :twitter_id
      t.string :screen_name
      t.string :oauth_token
      t.string :oauth_secret
      t.text :profile_image_url
      t.datetime :updated_at

      t.timestamps
    end
  end
end
