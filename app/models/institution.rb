class Institution < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true, presence:true
  validates :cnpj, presence:true
  validates :phone, presence:true
  validates :address, presence:true
end
