class ChangeColumnName2 < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :state, :order_status
  end
end
