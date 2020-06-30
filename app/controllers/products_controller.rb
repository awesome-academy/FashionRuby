class ProductsController < ApplicationController
  before_action :destroy_product, only: :destroy
  def index
    @catelogies = Catelogy.order :catelogy_name
    count_order=[]
    Product.all.each do |product|
    count_order<< {key: product , value: product.orderdetails.count}
    end
    sort = count_order.sort_by{|l| -l[:value]}
    @bestseller= sort.take(8)
    @catelogy = Catelogy.find_by id: params[:id]
    @catelogies = Catelogy.all
    if params[:search]
      @products = Product.search_one(params[:search])
      respond_to do |format|
        format.html
        format.json { render json: @products }
      end
      elsif params[:id]
        @products = @catelogy.products
      elsif params[:price]
        case  params[:price]
          when '1000'
            @products = Product.price(0,1000)
          when '3000'
            @products = Product.price(1000,3000)
          when '5000'
            @products = Product.price(3000,5000)
          when '10000'
            @products = Product.price(5000,10000)
          when '0'
            @products = Product.price1
          end
      else
        @products = Product.all
    end
  end

  def show
    @product = Product.find params[:id]
    @products = Product.prCatelogy(@product)
    respond_to do |format|
      format.html
      format.js
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
      render 'static_pages/home'
    end
  end

  def destroy
    @product= Product.find params[:id]
    @product.destroy
    redirect_to admin_products_path
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    if @product.update product_params
      redirect_to admin_product_path
    else
      render 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name, :catelogy_id , :price, :size, images: [])
  end

  def destroy_product
    @product = Product.find_by(id: params[:id])
      redirect_to root_url if @product.nil?
  end
end
