class ProductsController < ApplicationController
  before_action :logged_in?, only: [:create, :destroy]
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
    catelogyProducts = []
    @canpaign = Canpaign.where(status: true).first
    @sales_product_ids = @canpaign.nil? ? [] : @canpaign.products.pluck(:id)

    if params[:search]
      @products = Product.search_one(params[:search])
      respond_to do |format|
        format.html
        format.json { render json: @products }
      end
    elsif params[:id] && params[:price][0]!= "" && params[1] != ""
        priceProducts = Product.price(params[:price][0],params[:price][1])
        catelogys = Catelogy.find params[:id]
        catelogys.each do |catelogy|
           catelogyProducts += catelogy.products
        end
        @products = priceProducts & catelogyProducts
    elsif params[:id]
        catelogys = Catelogy.find params[:id]
        catelogys.each do |catelogy|
           @products += catelogy.products
        end
    elsif params[:price]
        @products = Product.price(params[:price][0],params[:price][1])
    else
      @products = Product.all.paginate(page: params[:page], per_page: Settings.best)
    end
  end

  def show
    # @comment = Comment.new
    @canpaign = Canpaign.where(status: true).first
    @sales_product_ids = @canpaign.nil? ? [] : @canpaign.products.pluck(:id)
    @product= Product.find(params[:id])
    @comments = @product.comments
    @comment = @product.comments.build
    @comments = @product.comments.paginate(page: params[:page], per_page: 5)
    @products = Product.prCatelogy(@product)
     @rating_users = []
      @rating_products = []
    Rating.all.each do |ratingClick|
      @rating_users << ratingClick.user_id
      @rating_products << ratingClick.product_id
    end
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create

    @product = Product.new product_params
    @product = current_user.products.build product_params
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
