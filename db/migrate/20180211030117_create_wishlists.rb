class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.string :name
      t.date :date_created, :default => Date.today
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
