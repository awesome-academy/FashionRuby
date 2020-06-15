class Admin::CanpaignsController < Admin::BaseController

  def index
    @canpaigns = Canpaign.canpaigns
  end

  def new
    @canpaign = Canpaign.new
    @products = Product.all
  end

  def create
    @canpaign = Canpaign.new canpaign_params
    if  @canpaign.save
      redirect_to canpaigns_path
    else
    @canpaign= Canpaign.new
     render 'new'
    end
  end

  def destroy
    @canpaign = Canpaign.find params[:id]
    @canpaign.destroy
    redirect_to  canpaigns_path
  end

  def update
    @canpaigns = Canpaign.find params[:id]
    if  @canpaigns.update canpaign_params
      redirect_to @canpaigns
    else
      render 'edit'
    end
  end

  def show
   @products = Canpaign.canpaigns
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


