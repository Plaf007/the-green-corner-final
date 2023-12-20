class Product < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  has_many :reviews, as: :reviewable, dependent: :destroy
  # has_many :cart_products, dependent: :destroy
  # has_many :order_products, dependent: :destroy

  validates :title, uniqueness: true, presence: true
  validates :description, :quantity, :price, :photo, presence: true
  validates :description, length: {minimum: 6}

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
  against: [ :title, :description, :category ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
