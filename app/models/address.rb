class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  validates :details, presence: true

  def coordinates
    [latitude, longitude]
  end
end
