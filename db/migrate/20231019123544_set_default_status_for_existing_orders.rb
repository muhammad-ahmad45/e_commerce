class SetDefaultStatusForExistingOrders < ActiveRecord::Migration[7.0]
  def change
    Order.where(status: nil).update_all(status: 'dispatched')
    change_column_default :orders, :status, from: nil, to: 'dispatched'
  end
end
