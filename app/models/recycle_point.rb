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
    "#{name} - #{category_label}, #{description}. Ubicado en #{address.details}"
  end

  private

  def category_label
    case category
    when 1
      'Reciclaje de Plástico'
    when 2
      'Reciclaje de Papel'
    when 3
      'Reciclaje de Metal'
    else
      'Reciclaje General'
    end
  end
end
