class AddCardnameToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :cardname, :string
  end
end
