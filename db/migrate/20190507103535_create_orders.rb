class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :cart, foreign_key: true
      t.integer :order_status
      t.string :coupone_code
      t.string :Address
      t.string :country
      t.string :references
      t.string :city
      t.string :references
      t.integer :paid_price
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :paymentMethod
      t.string :cardname
      t.string :cardnumber
      t.string :first_names
      t.string :last_names
      t.string :emails
      t.string :addresss

      t.timestamps
    end
  end
end
