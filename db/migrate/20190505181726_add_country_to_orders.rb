class AddCountryToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :Country, :string
  end
end
