class Admin::OrdersController < Admin::BaseController

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find params[:id]
  end

  def update
    @order = Order.find params[:id]
    @order.update_attributes(status: true)
    respond_to do |format|
      format.html
      format.js
      format.json{render json: {result: "OK"} }
    end
  end

  def destroy
    @order = Order.find params[:id]
    @order.destroy
    respond_to do |format|
      format.html
      format.js
      format.json{render json: {result: "OK"} }
    end
  end
end
