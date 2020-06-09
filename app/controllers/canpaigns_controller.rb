class CanpaignsController < ApplicationController

    def index
    @canpaigns = Canpaign.paginate(page: params[:page]).limit(3)
    end

  def new
    @canpaign= Canpaign.new
    @canpaigns = Canpaign.all.limit(1)
    @products = Product.all
end

  def create

  @canpaigns = Canpaign.new canpaign_params

    # params[:product][:catelogys][:name]

    if   @canpaigns.save
      redirect_to canpaigns_path
    else
      @canpaign= Canpaign.new
      @canpaigns = Canpaign.all.limit(1)
      @products = Product.all
      render 'new'
    end

  end



def destroy
    @canpaign = Canpaign.find(params[:id])
     redirect_to  canpaigns_path
   end


  def update
    @canpaign = Canpaign.find(params[:id])
    if  @canpaign.update(canpaign_params)
      redirect_to @canpaign
    else
      render 'edit'

    end
  end

  def show

    @canpaign = Canpaign.find(params[:id])

 @products = Canpaign.paginate(page: params[:page]).limit(2)


    @canpaign = Product.all


   @canpaigns = Canpaign.find(params[:id])


end





   def edit
    @canpaigns = Canpaign.find(params[:id])
    @products = Product.all
        @canpaign = Canpaign.find(params[:id])
   end




private

    def canpaign_params
      params.require(:canpaign).permit(
        :name, :content, :value, :status, product_ids: [])
        # images_attributes: [:name, :product_id, :url])
    end


    def product_params
      params.require(:product).permit(
        :name, :catelogy_id , :price, :size, images: []
        # images_attributes: [:name, :product_id, :url]

       )
    end



end


    #   flash[:id] = params[:id]
    # @product = Product.find_by(params[:id])
    # @ids = [1,2,3,4,5,6,7,8,9]
    # # @product = Product.find_by(1)






# 1. khi taoj order (order.save)
# 2. lay order_detail (order.order_details)
# 3. dung vong lap cho tat ca order_details
#   moi 1 order_details => mua 1 loai sp voi so luong nhat dinh
#   so luong con lai cuar san pham (trong bang Product) = so luong ban dau (product.ammount) - order_detail.quantity

 # private

 #    def product_params
 #      params.require(:product).permit(:amount, :price)
 #    end





#       before_action :destroy_product, only: :destroy
#     def index
#        @catelogies = Catelogy.order :catelogy_name
#           @products = Product.paginate(page: params[:page])
#     end




#   def new
#     @product = Product.new

#     @product.images.build
#   end


#   def create
#     @product = Product.new product_params
#     @product.images.attach(product_params[:images])
#     # params[:product][:catelogys][:name]

#     if @product.save

#       redirect_to root_url
#     else
#       render 'static_pages/home'
#     end
#   end




#   def destroy
#     @product.destroy
#     redirect_to root_url if @product.nil?
#   end



#   def edit
#     @product = Product.find(params[:id])
#   end





#   def update
#     @product = Product.find(params[:id])
#     if @product.update(product_params)
#       redirect_to root_url
#     else
#       render 'edit'

#     end
#   end


#   def show
#     @product = Product.find(params[:id])

#     @x = Product.where(catelogy: @product.catelogy)




#     if  @product.amount.to_i >= 1

#       @amount = @product.amount
#     else
#       @amount = 'het hang'
#     end
# end




    #   flash[:id] = params[:id]
    # @product = Product.find_by(params[:id])
    # @ids = [1,2,3,4,5,6,7,8,9]
    # # @product = Product.find_by(1)






# 1. khi taoj order (order.save)
# 2. lay order_detail (order.order_details)
# 3. dung vong lap cho tat ca order_details
#   moi 1 order_details => mua 1 loai sp voi so luong nhat dinh
#   so luong con lai cuar san pham (trong bang Product) = so luong ban dau (product.ammount) - order_detail.quantity

 # private

 #    def product_params
 #      params.require(:product).permit(:amount, :price)
 #    end



