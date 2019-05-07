class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :cart, foreign_key: true
      t.integer :order_status       default:0
      t.string :coupone_code
      t.string :Address
      t.integer :paid_price
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
