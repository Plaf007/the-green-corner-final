class SelectedProduct < ApplicationRecord
  include SharedFunctionality

  belongs_to :selected_productable, polymorphic: true
  belongs_to :product
end
