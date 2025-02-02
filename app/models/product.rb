class Product < ApplicationRecord
  belongs_to :seller, class_name: "User"
  validates :name, :description, presence: true
  validates :price, numericality: { greater_than: 0 }
  has_one_attached :image

  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
end

