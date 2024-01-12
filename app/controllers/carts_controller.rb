class CartsController < ApplicationController
  before_action :authenticate_user!
  include SharedFunctionality

  def show
    @cart = current_user.cart || current_user.create_cart
    @selected_products = @cart.selected_products.includes(:product)
    @total_due = calculate_total_due(@selected_products)
    @total_virtual_cash = calculate_total_virtual_cash(@selected_products)
  end
end
