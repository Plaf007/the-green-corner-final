class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  def coordinates
    [latitude, longitude]
  end
end
