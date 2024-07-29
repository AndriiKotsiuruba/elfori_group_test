ActiveAdmin.register Invoice do
  permit_params :status

  actions :all, except: :new

  filter :status, as: :select, collection: Invoice.statuses
  filter :collection
  filter :user

  index do
    selectable_column
    id_column
    column :collection
    column :user
    column(:status) { |i| i.status.humanize }
    column :created_at
    actions
  end

  show do
    attributes_table do
      row(:status) { |_i| invoice.status.humanize }
      row :collection
      row :user
      row(:email) { |_i| invoice.user.email }
      row(:name) { |_i| invoice.user.name }
      row(:surname) { |_i| invoice.user.surname }
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :status
    end
    f.actions
  end
end
