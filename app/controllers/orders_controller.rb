class OrdersController < ApplicationController
  def new
    if session[:carts].reject{|k| k == {} }.empty?
      redirect_to carts_path
    else
      @order = Order.new 
    end
  end

  def create
    user = User.find_by id: order_params[:user_id]
    @order = user.orders.build order_params
    if @order.save
      # session[:carts].reject{|k| k == {} }.each do |x|
      #   Orderdetail.create(order_id: Order.last.id ,product_id: x['id'], quantity: x['quantity'])
      # end
      redirect_to root_path
      flash[:danger] = "Order successful"
      session[:carts] = nil
    end	
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
