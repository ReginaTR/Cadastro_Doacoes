class AddIndexToInstitutionsEmail < ActiveRecord::Migration[7.1]
  def change
    add_index :institutions, :email, unique: true
  end
end
