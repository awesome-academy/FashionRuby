class OrdersController < ApplicationController
  def new
    if session[:carts].reject{|k| k == {} }.empty?
      redirect_to carts_path
    else
      @order = Order.new
    end
  end

  def create
    @order = Order.new order_params
    if @order.save
      OrderMailer.welCome(@order).deliver_now
      flash[:danger] = "Order successful"
      session[:carts] = nil
      redirect_to order_path(@order.id)
    end
  end

  def show
    @order = Order.find params[:id]
  end
private
  def order_params
    params.require(:order).permit( :user_id, :Name, :Email, :Address, :Phone,
     orderdetails_attributes: [:product_id, :quantity])
  end

  def set_product
    session[:carts].each do |s|
      product = Product.find s['id']
    end
  end
end
