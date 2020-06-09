class OrderStatus < ActiveRecord::Base
  has_many :ordercarts
end
