class SelectedProduct < ApplicationRecord
  belongs_to :selected_productable, polymorphic: true
  belongs_to :product
end
