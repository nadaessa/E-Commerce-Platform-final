class AddCityIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :city_id, :integer
  end
end
