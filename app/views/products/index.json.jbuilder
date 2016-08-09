json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :text, :image_url, :ptice
  json.url product_url(product, format: :json)
end
