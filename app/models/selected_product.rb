class SelectedProduct < ApplicationRecord
  belongs_to :selected_productable, polymorphic: true
end
