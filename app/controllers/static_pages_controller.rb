


# ("inner join orderdetail on product.id = id
# inner join order on id.orderid = order.id  ")


class StaticPagesController < ApplicationController
  def home

# before_action :search_product, only: [:index]
# @ids = Product.all.pluck(:id)
@products = Product.all.limit(4)
@deal = Product.all.pluck(:id)
@buy1free = Product.all.limit(1)
@sale = Product.find([1, 3])


count_order=[]
Product.all.each do |product|
count_order<< {key: product , value: product.orders.count}
    end
sort = count_order.sort_by{|l| -l[:value]}
@bestseller= sort.take(8)


  @Canpaign = Canpaign.where(status: true).first
  @Canpaign.products.all.limit(4)


    end

def help
   end

def about
   end
end










# @bestseller=Product.order(order_count: :desc)







# select Count(*) as dem ,produc.name ,order.id
#  from product
#   inner join orderdetail on product.id = id.product_id

#   inner join order on id.orderid = order.id
# order by dem desc
