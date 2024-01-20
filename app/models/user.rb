class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy

  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :recycle_points

  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address

  has_many :reviews, as: :reviewable
  has_one_attached :photo

  after_create :create_address

  def create_cart
    # cart = Cart.find_by(user_id: self)
    self.cart = Cart.create if self.cart.nil?
  end

  def update_virtual_cash(discount, gain)
    update(total_virtual_cash: total_virtual_cash - discount + gain)
  end

  def create_address
    return if address.present?

    Address.create(
      details: "Edita tu perfil para agregar una dirección",
      addressable: self
    )
  end
end
