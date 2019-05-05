class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :coupones, :type, :coupone_type
  end
end
