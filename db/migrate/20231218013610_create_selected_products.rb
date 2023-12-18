class CreateSelectedProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :selected_products do |t|
      t.integer :quantity
      t.decimal :price
      t.decimal :virtual_cash
      t.references :product, null: false, foreign_key: true
      t.references :selected_productable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
