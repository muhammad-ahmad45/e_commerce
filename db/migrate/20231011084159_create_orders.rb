class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :address
      t.float :total_bill
      t.string :status
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
