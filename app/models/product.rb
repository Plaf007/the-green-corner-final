class Product < ApplicationRecord
  enum category: {
    plastico: 0,
    vidrio: 1,
    madera: 2,
    aluminio: 3,
    electricos: 4,
    organicos: 5,
    otros: 6
  }

  belongs_to :user

  has_one_attached :photo

  has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :selected_products, as: :selected_productable, dependent: :destroy

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
