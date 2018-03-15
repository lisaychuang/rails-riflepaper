class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :uid, :string
    add_column :users, :admin, :boolean
  end
end
