class AddPaidPriceToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :paid_price, :integer
  end
end
