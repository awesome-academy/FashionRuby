class UsersController < ApplicationController
  before_action :admin_user, only: :destroy
  def index
    @users = User.all.paginate(page: params[:page], per_page: Settings.number)
  end

  def show
    @user = User.find params[:id]
    @order = @user.orders
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = t("global.canpaigs.welcom")
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  User.find(params[:id]).destroy
  flash[:success] = t("global.canpaigs.usedel")
  redirect_to users_url
  end

  private

   def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def user_params
  params.require(:user).permit(:name, :email,  :admin, :level, :password,
  :password_confirmation)
  end

  def correct_user
  @user = User.find(params[:id])
  redirect_to(root_url) unless current_user?(@user)
end

  def admin_user
  redirect_to(root_url) unless current_user.admin?
  end
end


