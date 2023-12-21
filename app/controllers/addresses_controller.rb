class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def create
    @addressable = find_addressable
    @address = @addressable.addresses.build(address_params)

    if @address.save
      redirect_to addressable_path(@addressable), notice: 'Address was successfully created.'
    else
      render "addressables/show", status: :unprocessable_entity
    end
  end

  def update
    if @address.update(address_params)
      redirect_to addressable_path(@address.addressable), notice: 'Address was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @addressable = @address.addressable
    @address.destroy

    redirect_to addressable_path(@addressable), notice: 'Address was successfully destroyed.'
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:details, :longitude, :latitude, :addressable_type, :addressable_id)
  end

  def find_addressable
    if params[:user_id]
      User.find(params[:user_id])
    elsif params[:recycle_point_id]
      RecyclePoint.find(params[:recycle_point_id])
    end
  end

  def addressable_path(addressable)
    if addressable.is_a?(User)
      user_path(addressable)
    elsif addressable.is_a?(RecyclePoint)
      recycle_point_path(addressable)
    end
  end
end
