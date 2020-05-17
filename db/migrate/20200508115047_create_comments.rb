class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :item_id
      t.integer :user_id
      # t.references :item, type: :integer, foreign_key: true
      # t.references :user, type: :integer, foreign_key: true

      t.timestamps
    end
  end
end
