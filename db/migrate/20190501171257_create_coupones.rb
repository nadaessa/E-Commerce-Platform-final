class CreateCoupones < ActiveRecord::Migration[5.2]
  def change
    create_table :coupones do |t|
      t.integer :type
      t.integer :value
      t.integer :expiration_type
      t.date :time
      t.integer :no_of_usage
      t.string :code
      t.integer :status     default: 0

      t.timestamps
    end
  end
end
