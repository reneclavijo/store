class Status < ApplicationRecord
    has_many :orders

    validates :description, presence: true, uniqueness: true
end
