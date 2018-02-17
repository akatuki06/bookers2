class AddImageToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :image, :text
  end

  def change
	rename_column :users, :image, :image_id
  end

end
