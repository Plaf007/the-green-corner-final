class AddDiscountAmountToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :discount_amount, :decimal
  end
end
