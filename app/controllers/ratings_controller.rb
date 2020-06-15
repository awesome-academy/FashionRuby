class RatingsController < ApplicationController

    def create
        @user=1
        @product = Product.find params[:product_id]
        ratings = {user_id: @user,product_id: @product}
        total = params[:ratings]

        @rating = Rating.new user_id: 1, product_id: @product, total: total
        if @rating.save

          redirect_to product_path(@product)

        end
  end



  def new

      @rating = Rating.new

  end


  def show
        @user=1
        @product = Product.find params[:product_id]
        ratings = {user_id: @user,product_id: @product.id}
        total = params[:ratings]
        @rating = Rating.new user_id: 2, product_id: @product.id, total: total
        respond_to do |format|
            format.html
            format.js
          end
        if @rating.save

          redirect_to product_path(@product)

        end
    # @product = Product.find_by(params[:id])
    # total = params[:value]
    # @rating = Rating.new user_id: 1, product_id: @product, total: total



  end

def index

 # @product = Product.find_by(params[:id])
 #    total = params[:ratings]

 #    @rating = Rating.new user_id: 1, product_id: @product, total: total



end


    # private

    # def correct_rating
    #   @rating = Rating.find(params[:rating_id])
    # end

    # def rating_params
    #   params.require(:rating).permit(:user_id, :product_id)
    # end

end




