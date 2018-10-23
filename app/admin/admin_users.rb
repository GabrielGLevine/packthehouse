ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation,
    theaters_attributes: [:id, :name, :contact, :_destroy, :_create, :_update]

  index do
    selectable_column
    id_column
    column :email
    column :theater_id
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end

    f.inputs do
      f.has_many :theater do |t|
        t.input :name
        t.input :contact
      end
    end
    f.actions
  end

end
