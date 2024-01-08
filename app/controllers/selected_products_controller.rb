class SelectedProductsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @cart = current_user.cart || current_user.create_cart
    @selected_product = @cart.selected_products.find_or_initialize_by(selected_productable: @product)

    if @selected_product.new_record?
      @selected_product.assign_attributes(quantity: 1, price: @product.price)
    else
      @selected_product.quantity += 1
    end

    if @selected_product.save
      redirect_to cart_path(@cart), notice: 'El producto se añadió a tu carrito correctamente.'
    else
      render :new, status: :unprocessable_entity, alert: 'No se logró añadir el producto a tu carrito.'
    end
  end

  def update_quantity
    @selected_product = find_selected_product_by_id(params[:id])

    if @selected_product
      new_quantity = params[:quantity].to_i

      if new_quantity.positive?
        @selected_product.update(quantity: new_quantity)
        flash[:notice] = "Se actualizó la cantidad del producto seleccionado."
      else
        @selected_product.destroy
        flash[:notice] = "Se quitó el producto de tu #{parent_model_name(@selected_product)}."
      end
    else
      flash[:alert] = "No se encontró el producto."
    end

    redirect_to cart_or_order_path
  end

  def destroy
    @selected_product = find_selected_product_by_id(params[:id])

    if @selected_product
      @selected_product.destroy
      flash[:notice] = "Se quitó el producto de tu #{parent_model_name(@selected_product)}."
    else
      flash[:alert] = "No se encontró el producto."
    end

    redirect_to cart_or_order_path
  end

  private

  def find_selected_product_by_id(id)
    order_selected_product = current_user.orders.joins(selected_products: :product).find_by(selected_products: { id: id })
    order_selected_product || current_user.cart.selected_products.find_by(id: id)
  end

  def parent_model_name(selected_product)
    selected_product.selected_productable_type == 'Order' ? 'orden' : 'carrito'
  end

  def cart_or_order_path
    @selected_product.selected_productable_type == 'Order' ? order_path : cart_path
  end
end
