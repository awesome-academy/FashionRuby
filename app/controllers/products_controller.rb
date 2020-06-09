class ProductsController < ApplicationController

    # before_action :search_product, only: [:index]
      before_action :destroy_product, only: :destroy
    def index
       @catelogies = Catelogy.order :catelogy_name
          @products = Product.paginate(page: params[:page])
    end

 # def search_book
 #    @product = if params[:query].present?
 #              Product.search(params[:query]).paginate page: params[:page],
 #                per_page: Settings.per_page_search
 #            elsif params[:check] == "1" && params[:query].present? == false
 #              Category.find(params[:catelogy_id]).products.paginate page: params[:page],
 #                per_page: Settings.per_page_search
 #            else
 #              Product.all.paginate page: params[:page],
 #                per_page: Settings.per_page
 #            end
 #      return if @product
 #      flash[:danger] = t("not_found")
 #      redirect_to root_path
 #    end







	def new
		@product = Product.new
		@product.images.build
	end


	def create
		@product = Product.new product_params
		@product.images.attach(product_params[:images])
		# params[:product][:catelogys][:name]

		if @product.save

			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end




	def destroy

		@product.destroy
    @product= Product.find(params[:id])

		redirect_to root_url if @product.nil?
	end



	def edit
		@product = Product.find(params[:id])
	end





	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to root_url
		else
			render 'edit'

		end
  end


	def show

    @product = Product.find(params[:id])

    @x = Product.where(catelogy: @product.catelogy_id)




        if  @product.amount.to_i >= 1

              @amount = @product.amount
            else
              @amount = 'het hang'
            end
        end






	def show
    @product = Product.find(params[:id])

    @x = Product.where(catelogy: @product.catelogy)




    if  @product.amount.to_i >= 1

      @amount = @product.amount
    else
      @amount = 'het hang'
    end
end




	private

		def product_params
			params.require(:product).permit(
				:name, :catelogy_id , :price, :size, images: []
				# images_attributes: [:name, :product_id, :url]
)
		end



		def destroy_product
			@product = Product.find_by(id: params[:id])

			redirect_to root_url if @product.nil?
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


end

