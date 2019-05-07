class AddFirstNamesToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :first_names, :string
  end
end
