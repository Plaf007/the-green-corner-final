class Order < ApplicationRecord
  belongs_to :user
  has_many :selected_products, as: :selected_productable
  validates :status, :purchase_date, presence: true
end
