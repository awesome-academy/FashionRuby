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
  has_many :users, through: :ratings
  has_many_attached :images
  scope :best_saler, -> {where "id in (select product_id
    from orderdetails group by product_id order by count(product_id) limit 5)"}
  scope :cateloly_name, -> {order(:catelogy_name).limit(2)}
  scope :catelogy, -> (id){where catelogy: id}
  idcate = "select catelogy_id from products where id = ?"
  scope :prCatelogy, ->(id){Product.where("id in (#{idcate})", id).limit(4) }
  validates :images,
      content_type: { in: %w[image/jpeg image/gif image/png],
              message: "must be a valid image format" },
      size: { less_than: 5.megabytes,
          message: "should be less than 5MB" }

  default_scope -> { order(created_at: :desc) }
  validates :images,
  		content_type: { in: %w[image/jpeg image/gif image/png],
  						message: "must be a valid image format" },
  		size: { less_than: 5.megabytes,
  				message: "should be less than 5MB" }
    scope :price, -> (a,b){where("price >= #{a} AND price < #{b}")}
    scope :price1, -> {where("price >= 10000")}

end

