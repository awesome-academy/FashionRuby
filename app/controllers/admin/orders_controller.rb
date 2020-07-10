class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.all.paginate(page: params[:page], per_page: Settings.number)
    respond_to do |format|
      format.html
      format.csv { send_data @orders.to_csv, filename: "orders-#{Date.today}.csv" }
    end
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

   def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end
