class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.float :price
      t.integer :quantity
      t.string :image
      t.references :store, foreign_key: true
      t.references :category, foreign_key: true
      t.references :brand, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
