class OrdersController < ApplicationController
	def new
		@products = []
		
		@session = session[:carts]
		unless @session.nil?

			@session.each do |product|
			
				unless product == {}
					@quantity = product['quantity']

					products = Product.find(product['id'])
					@products << products
				end
				
			end
		
		end
		
	end
end
