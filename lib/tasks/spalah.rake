namespace :spalah do
  desc 'Delete all products'
  task drop_products: :environment do
    product_count = Product.count
    Product.destroy_all
    puts '**********'
    puts "#{product_count} products was deleted"
    puts '**********'
  end
end
