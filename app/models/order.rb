class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :status
  has_many :order_details
  has_many :products, through: :order_details
  
  # todo: revisar generación del número del pedido
  validates :number, presence: true, numericality: true, uniqueness: true
  validates :total, presence: true, numericality: true
  validates :status_id, presence: true
end
