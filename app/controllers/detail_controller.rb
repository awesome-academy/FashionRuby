class DetailController < ApplicationController
  def index
    flash[:id] = params[:id]
    flash[:name] = "dang hoang thai"
  end

  def show
    flash[:id] = params[:id]
    @product = Product.find_by(params[:id])
    flash[:name] = "dang hoang thai"
    @ids = [1,2,3]

  end
end
