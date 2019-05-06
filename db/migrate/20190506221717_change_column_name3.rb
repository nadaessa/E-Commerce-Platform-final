class ChangeColumnName3 < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_items, :state, :status
  end
end
