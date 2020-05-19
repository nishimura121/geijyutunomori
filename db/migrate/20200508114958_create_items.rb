class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :image_id
      t.integer :user_id
      t.integer :genre_id
      t.integer :exp
      # t.references :user, type: :integer, foreign_key: true
      # t.references :genre, type: :integer, foreign_key: true

      t.timestamps
    end
  end
end
