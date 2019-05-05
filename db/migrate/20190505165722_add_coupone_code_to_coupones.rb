class AddCouponeCodeToCoupones < ActiveRecord::Migration[5.2]
  def change
    add_column :coupones, :coupone_code, :string
  end
end
