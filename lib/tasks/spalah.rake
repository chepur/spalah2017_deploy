namespace :spalah do
  namespace :api do
    desc 'Fix comments count of product'
    task comments_count: :environment do
      Product.find_in_batches do |group|
        group.each do |product|
          product.update_column(:comments_count, product.comments.count)
        end
      end
    end
  end

  desc 'TEST'
  task test: :environment do
    Product.transaction do
      User.first.update(first_name: 'Nick')
      product = Product.first
      Comment.create(text: 'LAST', product: product)

      product.name = nil

      if !product.save
        raise ActiveRecord::Rollback
      end
    end
  end
end
