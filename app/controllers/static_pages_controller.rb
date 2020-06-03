class StaticPagesController < ApplicationController
  def home

  	@products = Product.all

    @ids = Product.all.pluck(:id)

  end

  def help
  end

  def about
  end

  def products
  end
end
