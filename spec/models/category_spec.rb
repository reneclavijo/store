require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#create' do
      it 'when attributes are not valid' do
        # Arrange | Arreglar  | Preparar
        new_category = Category.new
        # Act     | Actar     | Ejecutar
        new_category.save
        # Assert  | Afirmas   | Validar
        expect(new_category.errors[:name].count).to_not be(0)
      end

      it 'when attributes are valid' do
        new_category = Category.new(name: 'food')

        new_category.save

        expect(new_category.id).to_not be(nil)
      end

      it 'when I want to save two categories with the same name in downcase' do
        category1 = Category.new(name: 'toys')
        category2 = Category.new(name: 'toys')

        category1.save
        category2.save

        expect(category2.errors[:name].count).to_not be(0)
      end

      it 'when the names are equal but case senstive' do
        category1 = Category.new(name: 'TOYS')
        category2 = Category.new(name: 'toys')

        category1.save
        category2.save

        expect(category2.errors[:name].count).to_not be(0)
      end

      it 'when the names are the same with no sequence' do
        category1 = Category.new(name: 'toys')
        category2 = Category.new(name: 'food')
        category3 = Category.new(name: 'beer')
        category4 = Category.new(name: 'cars')
        category5 = Category.new(name: 'toys') # repeted
        category6 = Category.new(name: 'bikes')

        category1.save
        category2.save
        category3.save
        category4.save
        category5.save
        category6.save

        expect(category1.errors[:name].count).to be(0)
        expect(category5.errors[:name].count).to_not be(0)
      end

  end
end
