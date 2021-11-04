class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :number
      t.integer :total
      t.references :user, null: true, foreign_key: true
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
