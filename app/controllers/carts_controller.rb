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
            end




      redirect_to product_path(params[:id])
  end



  def index

    #@product_cart = Product.find_by(params[:id])

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
  end



  def create
    if session[:carts].nil?
      session[:carts] = []
    end
    session[:carts] << params[:id]
    redirect_to product_path(params[:id])
  end


#   def destroy
#   # @cart = session[:carts]
#   # @item = cart[:carts].find { |item| item[:product_id] == params[:id] }
#   if item
#     cart[:carts].delete item
#   end
#   redirect_to cart_path
# end


def destroy

              session[:carts].each do |cart|
                if cart["id"] == params[:id]
                  # so sanh trong cart co id san pham day chua neu ma co thi +1
                  cart.delete("id")
                  cart.delete("quantity")
                end
              end

  redirect_to product_path(params[:id])
 end





  # def destroy
  #   @product.destroy
  #   @product= Product.find(params[:id])
  #   redirect_to root_url if @product.nil?
  # end



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
        :name, :catelogy_id , :price, :size, images: []
        # images_attributes: [:name, :product_id, :url]
        )
    end







end
