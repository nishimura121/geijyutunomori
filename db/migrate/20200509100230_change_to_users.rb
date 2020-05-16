class ChangeToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :sex, :integer
    add_column :users, :profile_image_id, :string
  end
end
