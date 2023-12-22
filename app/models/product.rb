class Product < ApplicationRecord
  enum category: {
    others: 0,
    food: 1,
    personalCare: 2,
    clothing: 3,
    cleaning: 4,
    furniture: 5
  }

  belongs_to :user

  has_one_attached :photo

  has_many :reviews, as: :reviewable, dependent: :destroy

  validates :title, uniqueness: true, presence: true
  validates :description, :quantity, :price, presence: true
  validates :description, length: {minimum: 6}

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
  against: [ :title, :description, :category ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

end
