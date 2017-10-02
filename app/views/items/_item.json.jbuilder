json.extract! item, :id, :name, :description, :status, :amount, :price, :picture, :category, :created_at, :updated_at
json.url item_url(item, format: :json)
