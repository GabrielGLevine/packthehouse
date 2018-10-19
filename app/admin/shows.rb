ActiveAdmin.register Show do
  index do
    selectable_column
    column :name
    column :time
    #actions
  end

  show do |show|
    attributes_table do
      row :name
      row :time
    end
  end
    # panel 'shows' do
    #   table_for restaurant.dishes do |t|
    #     t.column :title
    #     t.column :dish_type
    #     t.column :ingredients
    #     t.column :description
    #     t.column :price
    #   end
    # end
  permit_params :name, :time
end
