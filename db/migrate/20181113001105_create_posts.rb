class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.string :photo_url
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
