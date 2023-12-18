class CreateRecyclePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :recycle_points do |t|
      t.integer :category
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
