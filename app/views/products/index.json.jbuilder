json.products do
  json.array! @products, partial: 'product', as: :product
end
json.current_page @products.current_page
json.total_pages @products.total_pages
json.is_last_page @products.last_page?
json.limit_value @products.limit_value
