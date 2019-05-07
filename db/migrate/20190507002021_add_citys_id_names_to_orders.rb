class AddCitysIdNamesToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :citys_id, :integer
  end
end
