class PurchaseRecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  def index
    if @item.purchase_record.present?
      redirect_to root_path
    else
      @purchase_address = PurchaseAddress.new
      render 'orders/index'
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_record_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render 'orders/index', status: :unprocessable_entity
    end
  end

  def purchase_record_params
    params.require(:purchase_address).permit(:postal_code, :shipping_origin_id, :city, :street_address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id
    )
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
