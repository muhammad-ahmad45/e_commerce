class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.float :price
      t.integer :total_quantity
      t.integer :quantity_in_stock

      t.timestamps
    end
  end
end
