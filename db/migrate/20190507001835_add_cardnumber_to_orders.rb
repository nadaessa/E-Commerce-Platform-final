class AddCardnumberToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :cardnumber, :string
  end
end
