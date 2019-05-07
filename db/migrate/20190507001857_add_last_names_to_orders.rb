class AddLastNamesToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :last_names, :string
  end
end
