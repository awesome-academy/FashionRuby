class StaticPagesController < ApplicationController
  def home
    @products = Product.all.limit(4)
    @buy1free = Product.all.limit(1)
    @canpaign = Canpaign.where(status: true).first
    @bestseller =Product.best_saler
    end
  def help
   end
  def about
  end
  def products
    @catelogies = Catelogy.all
    @catelogy = Catelogy.find_by(id: params[:id])
    if params[:search]
    @products = Product.where(["lower(name) LIKE ?","%#{params[:search].downcase}%"])
    elsif params[:id]
    @products = @catelogy.products
    elsif params[:price]
    @products = Product.where(price: params[:price].to_i)
    else
    @products = Product.all
   end

  end
end
