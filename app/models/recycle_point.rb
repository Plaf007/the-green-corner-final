class RecyclePoint < ApplicationRecord
  has_many :addresses, as: :addressable
end
