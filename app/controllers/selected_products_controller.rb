class SelectedProductsController < ApplicationController
  before_action :set_selected_product, only: [:show, :edit, :update, :destroy]

  def index
    @selected_products = SelectedProduct.all
  end

  def show
  end

  def new
    @selected_product = SelectedProduct.new
  end

  def create
    @selected_product = SelectedProduct.new(selected_product_params)
    if @selected_product.save
      redirect_to @selected_product, notice: 'SelectedProduct was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @selected_product.update(selected_product_params)
      redirect_to @selected_product, notice: 'SelectedProduct was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @selected_product.destroy
    redirect_to selected_products_url, notice: 'SelectedProduct was successfully destroyed.'
  end

  private

  def set_selected_product
    @selected_product = SelectedProduct.find(params[:id])
  end

  def selected_product_params
    params.require(:selected_product).permit(:quantity, :price, :virtual_cash, :product_id, :selected_productable_id, :selected_productable_type)
  end
end
