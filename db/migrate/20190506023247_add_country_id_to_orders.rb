class AddCountryIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :country_id, :integer
  end
end
