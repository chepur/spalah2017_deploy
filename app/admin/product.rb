ActiveAdmin.register Product do
  permit_params :name, :price

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :updated_at
    column :created_at
    actions
  end

  filter :name

  form do |f|
    f.inputs "Product" do
      f.input :name
      f.input :price
    end
    f.actions
  end

end
