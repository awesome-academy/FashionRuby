class Order < ApplicationRecord
  belongs_to :user


  has_many :orderdetails, dependent: :destroy


  has_many :products, through: :orderdetails





end
