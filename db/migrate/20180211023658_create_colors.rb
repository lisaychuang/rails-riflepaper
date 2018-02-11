class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :name
      t.string :background
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
