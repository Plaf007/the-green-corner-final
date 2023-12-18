class RecyclePointsController < ApplicationController
  before_action :set_recycle_point, only: [:show, :edit, :update, :destroy]

  def index
    @recycle_points = RecyclePoint.all
  end

  def show
  end

  def new
    @recycle_point = RecyclePoint.new
  end

  def create
    @recycle_point = RecyclePoint.new(recycle_point_params)
    if @recycle_point.save
      redirect_to @recycle_point, notice: 'RecyclePoint was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recycle_point.update(recycle_point_params)
      redirect_to @recycle_point, notice: 'RecyclePoint was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @recycle_point.destroy
    redirect_to recycle_points_url, notice: 'RecyclePoint was successfully destroyed.'
  end

  private

  def set_recycle_point
    @recycle_point = RecyclePoint.find(params[:id])
  end

  def recycle_point_params
    params.require(:recycle_point).permit(:category, :name, :description)
  end
end
