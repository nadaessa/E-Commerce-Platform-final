class AddAddressToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :Address, :text
  end
end
