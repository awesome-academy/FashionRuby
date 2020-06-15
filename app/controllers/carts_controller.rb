class CartsController < ApplicationController
  def index
     @carts = []
     unless session[:carts].nil?
      session[:carts].each do |cart|
      product = Product.find_by id: cart["id"]
      if product
        product.quantity = cart["quantity"]
       @carts << product
      end
    end
  end
    if session[:carts].nil?
       session[:carts] = []
    end
       @session = session[:carts].reject{|k| k == {} }
       amount = 0
       @session.each do |n|
       @total = amount += (Product.find(n['id']).price * n['quantity'])
    end
      @order = Order.new
  end

  def show
    if  session[:carts].nil?
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
      redirect_to product_path(params[:id])
    end


  def create
    if session[:carts].nil?
       session[:carts] = []
    end
       session[:carts] << params[:id]
       redirect_to product_path(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    session[:carts].each do |cart|
    if cart["id"] == params[:id]
       cart.delete("id")
       cart.delete("quantity")
    end
  end
    redirect_to product_path(params[:id])
  end

private

  def product_params
    params.require(:product).permit(
    :name, :catelogy_id , :price, :size, images: [])
  end
end
