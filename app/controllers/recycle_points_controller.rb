class RecyclePointsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @recycle_points = RecyclePoint.all
    # if params[:query].present?
    #   @recycle_points = @recycle_points.search_by_title_and_description(params[:query])
    # end
  end

  def show
    @address = Address.new(addressable: @recycle_point)
  end

  def new
    @recycle_point = RecyclePoint.new
  end

  def create
    @recycle_point = RecyclePoint.new(recycle_point_params)
    @recycle_point.user_id = current_user.id
    if @recycle_point.save
      redirect_to recycle_point_path(@recycle_point), notice: 'recycle_point was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recycle_point.update(recycle_point_params)
      redirect_to @recycle_point, notice: 'recycle_point was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recycle_point.destroy
    redirect_to recycle_points_path, notice: 'recycle_point was successfully destroyed.'
  end

  private

  def set_recycle_point
    @recycle_point = RecyclePoint.find(params[:id])
  end

  def recycle_point_params
    params.require(:recycle_point).permit(:name, :description, :category)
  end
end
