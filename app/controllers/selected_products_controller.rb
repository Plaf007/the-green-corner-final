class SelectedProductsController < ApplicationController
  before_action :authenticate_user!
  include SharedFunctionality

  def create
    @product = Product.find(params[:product_id])
    @cart = current_user.cart || current_user.create_cart
    @selected_product = @cart.selected_products.find_by(product: @product)
    @cart.update(discount_amount: 0)

    if @selected_product
      @selected_product.quantity += 1
    else
      @selected_product = @cart.selected_products.create(selected_productable: @cart)
      @selected_product.assign_attributes(quantity: 1, price: @product.price, product: @product, virtual_cash: @product.virtual_cash)
    end
    if @selected_product.save
      redirect_to cart_path(@cart), notice: 'El producto se añadió a tu carrito correctamente.'
    else
      render :new, status: :unprocessable_entity, alert: 'No se logró añadir el producto a tu carrito.'
    end
  end

  def update_quantity
    @selected_product = SelectedProduct.find_by(id: params[:product].to_i)
    new_quantity = params[:selected_product][:quantity].to_i
    if new_quantity.positive?
      @selected_product.update(quantity: new_quantity)
      flash[:notice] = "Se actualizó la cantidad del producto seleccionado en tu #{parent_model_name(@selected_product)}."
    else
      @selected_product.destroy
      flash[:notice] = "Se quitó el producto de tu #{parent_model_name(@selected_product)}."
    end
    current_user.cart.update(discount_amount: 0)
    redirect_to cart_or_order_path(@selected_product)
  end

  def destroy
    @selected_product = find_selected_product_by_id(params[:id])

    if @selected_product
      @selected_product.destroy
      flash[:notice] = "Se quitó el producto de tu #{parent_model_name(@selected_product)}."
    else
      flash[:alert] = "No se encontró el producto."
    end
    current_user.cart.update(discount_amount: 0)
    redirect_to cart_or_order_path(@selected_product)
  end

  private

  def find_selected_product_by_id(id)
    order_selected_product = current_user.orders.joins(selected_products: :product).find_by(selected_products: { id: id })
    order_selected_product || current_user.cart.selected_products.find_by(id: id)
  end

  def parent_model_name(selected_product)
    selected_product.selected_productable_type == 'Order' ? 'orden' : 'carrito'
  end

  def cart_or_order_path(selected_product)
    if selected_product.selected_productable_type == 'Order'
      order_path(selected_product.selected_productable_id)
    else
      cart_path(selected_product.selected_productable_id)
    end
  end
end
