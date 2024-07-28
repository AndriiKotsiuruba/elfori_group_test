ActiveAdmin.register AdminUser do
  permit_params :name, :surname, :email, :password, :password_confirmation

  filter :email
  filter :name
  filter :surname

  index do
    selectable_column
    id_column
    column :name
    column :surname
    column :email
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :surname
      row :email
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :surname
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
