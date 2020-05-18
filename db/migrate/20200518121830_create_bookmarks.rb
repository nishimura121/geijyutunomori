class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.integer :item_id
      t.integer :user_id
      t.timestamps
      t.index [:user_id, :item_id], unique: true
    end
  end
end
