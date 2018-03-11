class AddColumnToWishlist < ActiveRecord::Migration
  def change
    add_column :wishlists, :notes, :string
    add_column :wishlists, :budget, :float
  end
end
