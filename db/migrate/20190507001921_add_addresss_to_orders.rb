class AddAddresssToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :addresss, :string
  end
end
