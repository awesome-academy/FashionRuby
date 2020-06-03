class Product < ApplicationRecord
  belongs_to :catelogy

  belongs_to :order, optional: true
  has_many :orderdetails
  has_many_attached :images
  default_scope -> { order(created_at: :desc) }
  # accepts_nested_attributes_for :images
  validates :images,
			content_type: { in: %w[image/jpeg image/gif image/png],
							message: "must be a valid image format" },
			size: { less_than: 5.megabytes,
					message: "should be less than 5MB" }





end
