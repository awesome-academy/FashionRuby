class Admin::CanpaignsController < Admin::BaseController
  def index
    @canpaigns = Canpaign.canpaigns
  end

  def new
    @canpaignNew = Canpaign.new
    @products = Product.all
    @canpaign = Canpaign.where(status: true).first
    @sales_product_ids = @canpaign.nil? ? [] : @canpaign.products.pluck(:id)
    @products = Product.prCatelogy(@product)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @canpaign = Canpaign.new canpaign_params
    if  @canpaign.save
      redirect_to admin_canpaigns_path
    else
    @canpaign = Canpaign.new
     render 'new'
    end
  end

  def destroy
    @canpaign = Canpaign.find params[:id]
    @canpaign.destroy
    redirect_to admin_canpaigns_path
  end

  def update
    @canpaigns = Canpaign.find params[:id]
    if  @canpaigns.update canpaign_params
      redirect_to admin_canpaign_path params[:id]
    else
      render 'edit'
    end
  end

  def show
    @canpaign = Canpaign.find params[:id]
     @products = Product.prCatelogy(@product)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @canpaign = Canpaign.find params[:id]
    @products = Product.all

  end

 private
  def canpaign_params
    params.require(:canpaign).permit(
    :name, :content, :value, :status, product_ids: [])
  end
end


