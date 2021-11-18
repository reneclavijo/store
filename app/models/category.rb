class Category < ApplicationRecord

    before_validation :to_downcase

    has_many :products

    validates :name, presence: true, uniqueness: true

    private
    def to_downcase
        if self.name
            self.name = self.name.downcase
        end
    end
end
