class Cart < ApplicationRecord
  include SharedFunctionality

  belongs_to :user
  has_many :selected_products, as: :selected_productable

  attribute :total_due, :decimal, default: 0.0
  attribute :discount_amount, :decimal, default: 0.0
end
