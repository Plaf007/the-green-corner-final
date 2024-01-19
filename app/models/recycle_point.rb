class RecyclePoint < ApplicationRecord
  has_one :address, as: :addressable
  has_many :reviews, as: :reviewable, dependent: :destroy

  geocoded_by :full_address
  after_validation :geocode

  validates :name, presence: true, length: { maximum: 255 }
  validates :category, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
  validates_associated :address

  def full_address
    "#{name} - #{category_label}, #{description}"
  end

  def category_label
    case category
    when 1
      'plásticos'
    when 2
      'papel y cartón'
    when 3
      'aluminio y otros metales'
    else
      'reciclables en general'
    end
  end
end
