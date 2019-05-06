class AddCouponeCodeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :coupone_code, :string
  end
end
