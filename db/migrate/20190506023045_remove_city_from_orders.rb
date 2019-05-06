class RemoveCityFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :City, :string
  end
end
