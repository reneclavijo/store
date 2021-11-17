class Product < ApplicationRecord
  belongs_to :category
  has_many :order_details
  has_many :orders, through: :order_details
  has_many :cart_products
  has_many :carts, through: :cart_products

  has_one_attached :main_photo
  has_many_attached :detail_photos

  validates :name, presence: true
  validates :price, presence: true, numericality: true
  validates :description, presence: true
  validates :category_id, presence: true
end
