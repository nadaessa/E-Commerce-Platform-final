class AddNameToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :Name, :string
  end
end
