class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy

  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :recycle_points

  has_many :addresses, as: :addressable
  has_many :reviews, as: :reviewable
  has_one_attached :photo

  def create_cart
    self.cart = Cart.new
  end
end
