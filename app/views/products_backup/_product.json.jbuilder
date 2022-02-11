json.extract! product, :id, :title, :note, :active, :created_at, :updated_at
json.url product_url(product, format: :json)
