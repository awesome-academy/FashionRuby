class CartsController < ApplicationController
  def show
    # @order_items = Order.order_items

    if  session[:carts].nil?
        session[:carts] = []
    end
              exist = false
              session[:carts].each do |cart|
                if cart["id"] == params[:id]
                  # so sanh trong cart co id san pham day chua neu ma co thi +1
                  cart["quantity"] += 1

                  exist = true
                end
              end
            unless exist
              session[:carts] << {id: params[:id], quantity: 1}
              # nếu mà trong cart chưa có id sản phẩm đấy thì nó thêm id sản phẩm mới vào cart và quantity = 1
      redirect_to product_path(params[:id])
  end
end


  def index
    #@product_cart = Product.find_by(params[:id])
    @order = Order.new
    unless session[:carts].nil?
      session[:carts].each do |cart|
       product = Product.find_by id: cart["id"]
       if product
         orderdetail = Orderdetail.new({product: product, quantity: cart["quantity"]})
         orderdetail.product = product
         @order.orderdetails << orderdetail

       end
      end
      @session = session[:carts].reject{|k| k == {} }
      amount = 0
      @session.each do |n|
        @total = amount += (Product.find(n['id']).price * n['quantity'])
      end
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
