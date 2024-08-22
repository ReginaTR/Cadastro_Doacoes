class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :quantity
      t.string :status
      t.references :institution, null: false, foreign_key: true

      t.timestamps
    end
  end
end
