

class Product < ApplicationRecord

  attr_accessor :quantity

  belongs_to :catelogy
  has_many :orderdetails, dependent: :destroy
  has_many :orders, through: :orderdetails

  has_many :sales, dependent: :destroy
  has_many :canpaigns, through: :sales

  has_many_attached :images

  validates :catelogy_id, presence: true
  has_many :ratings, dependent: :destroy
  has_many :users, through: :raings
  has_many_attached :images

  default_scope -> { order(created_at: :desc) }
  validates :images,
			content_type: { in: %w[image/jpeg image/gif image/png],
							message: "must be a valid image format" },
			size: { less_than: 5.megabytes,
					message: "should be less than 5MB" }


end









  # belongs_to :order, optional: true

  # accepts_nested_attributes_for :images



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
