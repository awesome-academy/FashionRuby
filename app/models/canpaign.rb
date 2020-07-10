class Canpaign < ApplicationRecord
  has_many :sales  ,dependent: :destroy
  has_many :products, through: :sales
  accepts_nested_attributes_for :sales
  validates :name, presence: true
  scope :canpaigns, ->{order(created_at: :desc).limit 5}
  enum status: {open: true, closed: false}
  validate :duplicate_canpaign, on: :create

  def duplicate_canpaign
    canpaign = Canpaign.where("status = true")
    errors.add(:canpaign_id, "duplicate canpaign") unless canpaign.empty?
  end
end
