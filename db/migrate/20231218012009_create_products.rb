class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.text :details
      t.integer :category
      t.integer :quantity
      t.decimal :price
      t.decimal :virtual_cash
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
