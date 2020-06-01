class ProductsController < ApplicationController
	before_action :destroy_product, only: :destroy

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end


	def create

		@product = Product.new product_params
	
		# params[:product][:catelogys][:name]
		if @product.save

			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end




	def destroy
		@product.destroy
		redirect_to root_url if @product.nil?
	end



	def edit
		@product = Product.find_by(id: params[:id])
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
			params.require(:product).permit(:name, :catelogy_id , :price, :size )
		end



		def destroy_product
			@product = Product.find_by(id: params[:id])
			
			redirect_to root_url if @product.nil?
		end

end
