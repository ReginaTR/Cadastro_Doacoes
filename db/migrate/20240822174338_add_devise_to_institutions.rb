class AddDeviseToInstitutions < ActiveRecord::Migration[7.1]
  def self.up
    change_table :institutions do |t|
      ## Database authenticatable
      # t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at


    end

    # Verificar se o índice já existe antes de criar
    unless index_exists?(:institutions, :email)
      add_index :institutions, :email, unique: true
    end

    unless index_exists?(:institutions, :reset_password_token)
      add_index :institutions, :reset_password_token, unique: true
    end


  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
