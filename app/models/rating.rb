class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validate :duplicate_rating, on: :create

  def duplicate_rating
    rating = Rating.where("user_id = ? and product_id = ?", user.id, product.id)
    errors.add(:product_id, "duplicate rating") unless rating.nil?
  end
end
