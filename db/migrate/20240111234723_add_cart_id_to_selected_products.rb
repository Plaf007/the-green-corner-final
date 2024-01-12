class AddCartIdToSelectedProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :selected_products, :cart, null: false, foreign_key: true
  end
end
