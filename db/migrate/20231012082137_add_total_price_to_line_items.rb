class AddTotalPriceToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :total_price, :float
  end
end
