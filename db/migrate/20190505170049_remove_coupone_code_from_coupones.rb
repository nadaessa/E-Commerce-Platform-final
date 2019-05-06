class RemoveCouponeCodeFromCoupones < ActiveRecord::Migration[5.2]
  def change
    remove_column :coupones, :coupone_code, :string
  end
end
