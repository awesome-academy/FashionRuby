class CartsController < ApplicationController
  def index
    @products = Product.all.limit(4)
    @canpaign = Canpaign.where(status: true).first
    @sales_product_ids = @canpaign.nil? ? [] : @canpaign.products.pluck(:id)
    @order = Order.new
    unless session[:carts].nil?
      session[:carts].each do |cart|
        product = Product.find_by id: cart["id"]
        if product
          orderdetail = Orderdetail.new(
          {product: product, quantity: cart["quantity"]})
          orderdetail.product = product
          @order.orderdetails << orderdetail
        end


      end
      carts = session[:carts].reject{|k| k == {} }
      @total = 0
        carts.each do |n|
          @total += (Product.find(n['id']).price * n['quantity'])
        end
    end

  end

  def show
    if session[:carts].nil?
      session[:carts] = []
    end
    exist = false
      session[:carts].each do |cart|
        if cart["id"] == params[:id]
          cart["quantity"] += 1
          exist = true
        end
      end
      unless exist
        session[:carts] << {id: params[:id], quantity: 1}
      end
      respond_to do |format|
        format.html
        format.js
      end
  end

  def create
    if session[:carts].nil?
      session[:carts] = []
    end
    session[:carts] << params[:id]
    redirect_to product_path(params[:id])
  end

  def destroy
    session[:carts].each do |cart|
    if cart["id"] == params[:id]
      cart.delete("id")
      cart.delete("quantity")
    end
  end
    carts = session[:carts].reject{|k| k == {} }
    @total = 0
    carts.each do |n|
      @total += (Product.find(n['id']).price * n['quantity'])
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_url
      else
    render 'edit'
      end
  end

  private

  def product_params
    params.require(:product).permit(
    :name, :catelogy_id , :price, :size, images: [])
  end
end
