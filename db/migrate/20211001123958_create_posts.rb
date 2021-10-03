class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :title
      t.text :caption
      t.string :post_image_id
      t.integer :price
      t.string :item
      t.string :shop_name
      t.string :material
      t.string :jewel
      t.float :rate
      
      t.timestamps
    end
  end
end
