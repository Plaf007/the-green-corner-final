class AddInformationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :total_virtual_cash, :decimal, precision: 10, scale: 2, default: 0.0
  end
end
