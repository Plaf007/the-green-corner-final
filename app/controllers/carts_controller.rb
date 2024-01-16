class CartsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :authenticate_user!
  include SharedFunctionality

  def show
    @cart = current_user.cart || current_user.create_cart
    @selected_products = @cart.selected_products.includes(:product)
    @total_virtual_cash = calculate_total_virtual_cash(@selected_products)
    @subtotal_due = calculate_total_due(@selected_products)
    @max_discount = [current_user.total_virtual_cash, @subtotal_due].min
    @cart.update(total_due: calculate_total_due(@selected_products) - @cart.discount_amount)
  end

  def apply_discount
    @cart = current_user.cart
    @discount_amount = params[:cart][:discount_amount].to_d
    @subtotal_due = calculate_total_due(@cart.selected_products)

    if @discount_amount <= current_user.total_virtual_cash && @discount_amount >= 0 && @discount_amount <= @subtotal_due
      @cart.update(discount_amount: @discount_amount)
      if @discount_amount.positive?
        flash[:notice] = "El descuento de #{number_to_currency(@discount_amount)} se aplicó correctamente."
      else
        flash[:notice] = "No se aplicó ningún descuento."
      end
    else
      flash[:alert] = "La cantidad introducida debe ser mayor a 0 y menor a #{@cart.total_due + @cart.discount_amount}."
    end
    redirect_to cart_path(@cart)
  end
end
