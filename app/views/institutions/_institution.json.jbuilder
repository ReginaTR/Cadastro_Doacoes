json.extract! institution, :id, :name, :email, :cnpj, :address, :phone, :created_at, :updated_at
json.url institution_url(institution, format: :json)
