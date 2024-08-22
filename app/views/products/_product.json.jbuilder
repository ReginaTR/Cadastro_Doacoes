json.extract! product, :id, :name, :description, :quantity, :status, :institution_id, :created_at, :updated_at
json.url product_url(product, format: :json)
