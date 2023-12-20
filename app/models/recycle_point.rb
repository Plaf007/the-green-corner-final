class RecyclePoint < ApplicationRecord
  has_one :address, as: :addressable
end
