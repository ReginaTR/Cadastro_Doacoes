class CreateInstitutions < ActiveRecord::Migration[7.1]
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :email
      t.string :cnpj
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
