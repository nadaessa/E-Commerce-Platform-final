class AddEmailsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :emails, :string
  end
end
