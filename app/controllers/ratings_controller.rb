class RatingsController < ApplicationController

  def create
    @user=1
    @product = Product.find params[:product_id]
    total = params[:ratings]
    @rating = Rating.new user_id: 1, product_id: @product, total: total #curren_user.User.build
    if @rating.save
      redirect_to product_path(@product)
    end
  end

  def show
    @user=1
    @product = Product.find params[:product_id]
    total = params[:ratings]
    @rating = Rating.new user_id: 1, product_id: @product.id, total: total
      if @rating.save
        redirect_to product_path(@product)
      end
    respond_to do |format|
      format.html
      format.js
      end
    end
  end




