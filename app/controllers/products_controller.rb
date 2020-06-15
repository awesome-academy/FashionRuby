class ProductsController < ApplicationController
  before_action :destroy_product, only: :destroy
  def index
    @catelogies = Catelogy.order :catelogy_name
    @products = Product.paginate(page: params[:page])
    end

  def show
    @product = Product.find params[:id]
    @x = Product.catelogy(@product.catelogy_id)
    if  @product.amount >= 1
      @amount = @product.amount
    else
      @amount = 'het hang'
    end
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new product_params
    @product.images.attach product_params[:images]
    if @product.save
      redirect_to root_url
    else
      render root_path
    end
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    if @product.update product_params
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @product= Product.find params[:id]
    @product.destroy
    redirect_to root_url if @product.nil?
  end

private

  def product_params
    params.require :product.permit(
    :name, :catelogy_id , :price, :size, images: [])
  end
end

