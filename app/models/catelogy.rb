class Catelogy < ApplicationRecord

	has_many :products, dependent: :destroy


end
