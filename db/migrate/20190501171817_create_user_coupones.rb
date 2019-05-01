class CreateUserCoupones < ActiveRecord::Migration[5.2]
  def change
    create_table :user_coupones do |t|
      t.references :user, foreign_key: true
      t.references :coupone, foreign_key: true

      t.timestamps
    end
  end
end
