ActiveAdmin.register Collection do
  permit_params :title, :description, :publish, images_attributes: %i[id file _destroy]

  filter :publish
  filter :title

  index do
    selectable_column
    id_column
    column :title
    column :publish
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :publish
      row :description
      row :created_at
      row :updated_at
      if resource.images
        table_for resource.images do
          column 'Images' do |image|
            image_tag image.file.url if image.file.present?
          end
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :publish
      f.input :description, as: :froala_editor
      f.has_many :images, allow_destroy: true do |image|
        image.input :file, as: :file, hint: (image_tag(image.object.file.url, size: 100) if image.object&.file.present?)
      end
    end
    f.actions
  end
end
