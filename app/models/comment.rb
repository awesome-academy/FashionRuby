class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  default_scope -> {order(created_at: :desc)}
  validates :product_id,  presence: true
  validates :user_id,    presence: true
  validates :content,    presence: true
end

