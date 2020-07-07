class RatingsController < ApplicationController
  before_action :logged_in?, only: [:create, :destroy, :edit, :show]
  before_action :correct_user, only: :destroy

  def create
    @product = Product.find params[:product_id]
    total = params[:ratings]
    @rating = current_user.ratings.build({product_id: @product.id, total: total})
    if @rating.save
      respond_to do |format|
        format.html
        format.js
      end
    else
      respond_to do |format|
        format.html
        format.js {render :fail}
      end
    end
  end

  def show
    @product = Product.find params[:product_id]
    total = params[:ratings]
    @rating = current_user.ratings.build product_id: @product.id
      if @rating.save
        redirect_to product_path(@product)
      end
    respond_to do |format|
      format.html
      format.js
    end
  end

private

  def correct_user
    @rating = current_user.ratings.build product_id: @product.id
    redirect_to root_url if @rating.nil?
  end
end
