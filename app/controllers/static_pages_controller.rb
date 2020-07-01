class StaticPagesController < ApplicationController
  def home
    @products = Product.all.limit(4)
    @canpaign = Canpaign.where(status: true).first
    @bestseller =Product.best_saler
    @sales_product_ids = @canpaign.nil? ? [] : @canpaign.products.pluck(:id)
  end

  def products
    count_order=[]
    Product.all.each do |product|
    count_order<< {key: product , value: product.orderdetails.count}
    end
    sort = count_order.sort_by{|l| -l[:value]}
    @bestseller= sort.take(8)
    @catelogy = Catelogy.find_by id: params[:id]
    @catelogies = Catelogy.all
    if params[:search]
      @products = Product.where(["lower(name) LIKE ?","%#{params[:search].downcase}%"])
      elsif params[:id]
        @products = @catelogy.products
      elsif params[:price]
        case  params[:price]
          when '1000'
            @products = Product.price(0,1000)
          when '3000'
            @products = Product.price(1000,3000)
          when '5000'
            @products = Product.price(3000,5000)
          when '10000'
            @products = Product.price(5000,10000)
          when '0'
            @products = Product.price1
          end
      else
        @products = Product.all
    end
  end
end
