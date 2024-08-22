require 'rails_helper'

RSpec.describe Institution, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:cnpj) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:phone) }

  it { should allow_value("email@example.com").for(:email) }

  it 'should not allow duplicate emails' do
    Institution.create!(name: 'Charity One', email: 'test@example.com', cnpj: '12345678901234', address: 'Address One', phone: '1234567890')
    institution = Institution.new(name: 'Charity Two', email: 'test@example.com', cnpj: '12345678901235', address: 'Address Two', phone: '0987654321')
    expect(institution).not_to be_valid
    expect(institution.errors[:email]).to include('has already been taken')
  end
end
