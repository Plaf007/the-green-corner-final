class OrdersController < ApplicationController
  before_action :authenticate_user!
  include SharedFunctionality

  def index
    @orders = current_user.orders
  end

  def create
    @cart = current_user.cart

    if @cart.selected_products.empty?
      flash[:alert] = "No se puede crear una orden con el carrito vacío."
      redirect_to cart_path(@cart)
    else
      @order = Order.new(user: current_user, status: 0, purchase_date: Date.today)

      if @order.save
        @cart.selected_products.update_all(
          selected_productable_type: 'Order',
          selected_productable_id: @order.id
        )
        @cart.destroy

        redirect_to order_path(@order), notice: 'La orden se creó correctamente.'
      else
        redirect_to cart_path, alert: 'No se logró crear la orden.'
      end
    end
  end

  def show
    @order = current_user.orders.find(params[:id])
    @selected_products = @order.selected_products.includes(:product)
    @total_due = calculate_total_due(@selected_products)
    @total_virtual_cash = calculate_total_virtual_cash(@selected_products)
  end

  helper_method :display_order_status

  private

  def display_order_status(status)
    case status
    when 0
      'Pendiente'
    when 1
      'Despachada'
    when 2
      'Entregada'
    when 3
      'Cancelada'
    else
      'Otro'
    end
  end
end
