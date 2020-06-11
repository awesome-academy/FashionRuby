class Order < ApplicationRecord
  belongs_to :user


  has_many :orderdetails, dependent: :destroy
  has_many :products, through: :orderdetails

accepts_nested_attributes_for :orderdetails

	def add_product_form_orderdetails(sessions)
			sessions.each do |x|
		end
	end

	




end
