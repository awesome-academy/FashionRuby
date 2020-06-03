class ProductsController < ApplicationController
    before_action :search_product, only: [:index]
def index
  catelogies = Catelogy.order :catelogy_name
end

  def show
end
 def search_book
    @product = if params[:query].present?
              Product.search(params[:query]).paginate page: params[:page],
                per_page: Settings.per_page_search
            elsif params[:check] == "1" && params[:query].present? == false
              Category.find(params[:catelogy_id]).products.paginate page: params[:page],
                per_page: Settings.per_page_search
            else
              Product.all.paginate page: params[:page],
                per_page: Settings.per_page
            end
    return if @product
    flash[:danger] = t("not_found")
    redirect_to root_path
  end

  def product_params
    params.require(:product).permit :catelogy_id, :name, :price, :size,
      :price, :description
  end
  end

