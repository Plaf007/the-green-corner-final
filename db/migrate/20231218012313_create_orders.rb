class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.date :purchase_date
      t.decimal :total_due
      t.integer :status
      t.decimal :virtual_cash

      t.timestamps
    end
  end
end
