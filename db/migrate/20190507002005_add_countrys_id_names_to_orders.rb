class AddCountrysIdNamesToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :countrys_id, :integer
  end
end
