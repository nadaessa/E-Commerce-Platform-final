json.extract! product, :id, :title, :description, :price, :quantity, :image, :store_id, :category_id, :brand_id, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
