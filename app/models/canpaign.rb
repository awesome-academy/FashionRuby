class Canpaign < ApplicationRecord

  has_many :sales  ,dependent: :destroy
  has_many :products, through: :sales
  accepts_nested_attributes_for :sales

  validates :name, presence: true
  default_scope -> { order(created_at: :desc) }




end
