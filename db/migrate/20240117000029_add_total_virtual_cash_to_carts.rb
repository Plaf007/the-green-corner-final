class AddTotalVirtualCashToCarts < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :total_virtual_cash, :decimal, default: 0.0
  end
end
