

class Product < ApplicationRecord

  belongs_to :catelogy
  has_many :orderdetails
  has_many :orders, through: :orderdetails
  has_many :images
  has_many :sales


  default_scope -> {order(created_at: :desc)}


  validates :catelogy_id, presence: true
end



# require "elasticsearch/model"
# class Book < ApplicationRecord
#   include Elasticsearch::Model
#   include Elasticsearch::Model::Callbacks

#   belongs_to :category
#   has_many :cart_items, dependent: :destroy
#   has_many :carts, through: :cart_items

#   default_scope ->{order created_at: :desc}

#   validates :category_id, presence: true
# end
