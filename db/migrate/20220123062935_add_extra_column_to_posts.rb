class AddExtraColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :room_name, :string 
    add_column :posts, :room_introduction, :text
    add_column :posts, :price, :integer
    add_column :posts, :room_image, :string
  end
end
