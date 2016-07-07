class AddPictureToProducts < ActiveRecord::Migration
  def up
    add_attachment :products, :picture
  end

  def down
    remove_attachment :products, :picture
  end
end
