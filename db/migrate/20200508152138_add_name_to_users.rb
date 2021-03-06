class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hp_address, :string
    add_column :users, :sns_address, :string
    add_column :users, :self_introduction, :text
    add_column :users, :is_cancel, :boolean, default: false, null: false
  end
end
