class UsersController < ApplicationController
	def show

  end
  def new
  	@user = User.new
  end

  def create
	@user = User.new(user_params)
	if @user.save
		log_in @user
		flash[:success] = "Welcome to the Sample App!"
	redirect_to @user
	else
	render 'new'
	end
end


private
def product_params
params.require(:product).permit(:name, :catelogyid, :canpaignid, :price, :size, :company)
end

end
