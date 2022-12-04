class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :no_order_item, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @form = Form.new
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(order_params)
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:form).permit(:post_code, :shipping_area_id, :municipalities, :address,
                                 :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def no_order_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end
