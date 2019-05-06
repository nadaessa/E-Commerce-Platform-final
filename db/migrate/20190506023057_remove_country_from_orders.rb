class RemoveCountryFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :Country, :string
  end
end
