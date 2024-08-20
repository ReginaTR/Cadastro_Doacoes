class Institution < ApplicationRecord
  validates :name, :email, :cnpj, :address, :phone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }, uniqueness: { case_sensitive: false }
end
