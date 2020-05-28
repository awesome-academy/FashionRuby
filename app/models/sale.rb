class Sale < ApplicationRecord
  belongs_to :products
  belongs_to :canpaign
end
