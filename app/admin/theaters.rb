ActiveAdmin.register Theater do
  index do
    column :name
    column :contact
  end

  show do |theater|
    attributes_table do
      row :name
      row :contact
    end
  end

  permit_params :name, :contact
end
