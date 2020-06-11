class Order < ApplicationRecord
  belongs_to :user


  has_many :orderdetails, dependent: :destroy
  has_many :products, through: :orderdetails

accepts_nested_attributes_for :orderdetails


end
