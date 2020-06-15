class CanpaignsController < ApplicationController
    def index
    @canpaigns = Canpaign.canpaigns
    end
     def create
    @canpaigns = Canpaign.new canpaign_params
    if  @canpaigns.save
      redirect_to canpaigns_path
    else

    @canpaigns = Canpaign.all.limit(1)
    @products = Product.all
      render 'new'
    end
  end
  def new
    @canpaign= Canpaign.new
    @products = Product.all
    end
  def edit
    @products = Product.all
    @canpaign = Canpaign.find params[:id]
   end
   def show
 @products = Canpaign.canpaigns
   end
  def update
    @canpaign = Canpaign.find(params[:id])
    if  @canpaign.update(canpaign_params)
      redirect_to @canpaign
    else
      render 'edit'
    end
  end
  def destroy
    @canpaign = Canpaign.find params[:id]
    @canpaign.destroy
    redirect_to  canpaigns_path
  end
private
  def canpaign_params
      params.require(:canpaign).permit(:name, :content, :value, :status, product_ids: [])
    end
  end


