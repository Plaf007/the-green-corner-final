class Cart < ApplicationRecord
  belongs_to :user
  has_many :selected_products, as: :selected_productable
end
