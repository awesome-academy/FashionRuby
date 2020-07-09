class CanpaignsController < ApplicationController
 before_action :logged_in_user, only: [:edit, :update,:new, :index]
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
      redirect_to admin_canpaigns_path
    else
      flash[:success] = "Account activated!"
      redirect_to @canpaign
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
  end

  def edit
    @canpaign = Canpaign.find params[:id]

  end

  private
  def canpaign_params
  params.require(:canpaign).permit(:name, :content,
    :value, :status, product_ids: [])
  end

end

