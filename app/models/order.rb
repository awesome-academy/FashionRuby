class Order < ApplicationRecord
  belongs_to :user
  has_many :orderdetails, dependent: :destroy
  has_many :products, through: :orderdetails
  accepts_nested_attributes_for :orderdetails
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        validates :Email, presence: true, length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX }
  def self.to_csv
    attributes = %w{id Name Address Phone Email status }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.find_each do |order|
        csv << attributes.map{ |attr| order.send(attr) }
      end
    end
  end
end
