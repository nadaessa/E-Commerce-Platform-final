class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :state  default: 1
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
