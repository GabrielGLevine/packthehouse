ActiveAdmin.register Show do
  index do
    column :name
    column :time
    column :location
    column :price
    column :industry_price
    column :link
  end

  show do |show|
    attributes_table do
      row :name
      row :time
      row :location
      row :price
      row :industry_price
      row :link
    end
  end

  controller do
    def new
      @show = Show.new
      @show.theater = current_admin_user.theater

      # call `new!` to ensure that the rest of the action continues as normal
      new!
    end
  end

  permit_params :name, :time, :location, :price,
                :industry_price, :link, :theater
end
