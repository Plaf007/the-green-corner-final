class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index, :show, :edit, :destroy ]

  def index
    @products = Product.all
    if params[:query].present?
      @products = @products.search_by_title_and_description(params[:query])
    end
  end

  def show
    @review = Review.new(reviewable: @product)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to product_path(@product), notice: 'Product was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to my_products_path, notice: 'Product was successfully destroyed.'
  end

  def my_products
    @my_products = current_user.products
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :details, :category, :quantity, :price, :virtual_cash, :photo, :user_id)
  end
end
