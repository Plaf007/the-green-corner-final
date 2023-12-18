class SelectedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :selected_productable, polymorphic: true
end
