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
  end
end
