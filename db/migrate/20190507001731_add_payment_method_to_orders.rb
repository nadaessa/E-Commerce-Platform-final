class AddPaymentMethodToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :paymentMethod, :string
  end
end
