class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :details
      t.float :longitude
      t.float :latitude
      t.references :addressable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
