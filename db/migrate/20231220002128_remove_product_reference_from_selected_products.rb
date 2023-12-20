class RemoveProductReferenceFromSelectedProducts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :selected_products, :product, foreign_key: true
  end
end
