

class Product < ApplicationRecord


  belongs_to :catelogy


  has_many :orderdetails
  has_many :orders, through: :orderdetails
  has_many :sales
  has_many :canpaigns, through: :sales





  validates :catelogy_id, presence: true

  has_many_attached :images

  attr_accessor :quantity
  has_many :sales, dependent: :destroy
  has_many :orderdetails, dependent: :destroy
  belongs_to :catelogy

  # belongs_to :order, optional: true

  default_scope -> { order(created_at: :desc) }
  # accepts_nested_attributes_for :images
  validates :images,
			content_type: { in: %w[image/jpeg image/gif image/png],
							message: "must be a valid image format" },
			size: { less_than: 5.megabytes,
					message: "should be less than 5MB" }


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
