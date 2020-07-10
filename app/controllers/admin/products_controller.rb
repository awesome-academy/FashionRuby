class Admin::ProductsController < Admin::BaseController
    before_action :destroy_product, only: :destroy
    def index
    @catelogies = Catelogy.order :catelogy_name
    @products = Product.paginate(page: params[:page], per_page: Settings.number)

    end
    def new
    @product = Product.new
    @product.images.build

  end

    def create
    @product = Product.new product_params
    # @product.images.attach product_params[:images]
    if @product.save
      redirect_to @product
    else
      render 'home'
    end
  end

    def destroy
    @product= Product.find params[:id]
    @product.destroy
    redirect_to admin_product_path
  end

    def edit
    @product = Product.find params[:id]
  end

    def update
    @product = Product.find params[:id]
    if @product.update(product_params)
      redirect_to admin_product_path @product.id
    else
      redirect_to root_url if @product.nil?
    end
  end

    def show
        @product = Product.find params[:id]
        @x = Product.where(catelogy: @product.catelogy_id)
    if  @product.amount.to_i >= 1
        @amount = @product.amount
    else
        @amount = 'het hang'
         end
      end
  private

    def product_params
       params.require(:product).permit(
       :name, :catelogy_id , :price, :size, images: [] )
    end

    def destroy_product
        @product = Product.find_by id: params[:id]
        redirect_to root_url if @product.nil?
    end

  end

