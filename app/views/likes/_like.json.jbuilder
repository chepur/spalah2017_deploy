json.success result
json.action params[:action]
json.count resource.like_count
json.unlike_path unlike_product_likes_path(resource)
json.like_path like_product_likes_path(resource)