ActiveAdmin.register Plate do
  permit_params :collection_id, :title, :order, image_attributes: %i[id file _destroy]

  filter :title

  controller do
    def new
      super do |_format|
        resource.build_image if resource.image.blank?
      end
    end

    def find_resource
      resource = scoped_collection.find(params[:id])
      resource.build_image if resource.image.blank?
      resource
    end
  end

  index do
    selectable_column
    id_column
    column :collection
    column :title
    column :order
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :collection
      row :title
      row :order
      row :created_at
      row :updated_at
      row :image do |resource|
        image_tag resource.image.file.url if resource.image.file.present?
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :collection
      f.input :title
      f.input :order
      f.has_many :image, allow_destroy: true, new_record: false do |image|
        image.input :file, as: :file, hint: (image_tag(image.object.file.url, size: 100) if image.object&.file.present?)
      end
    end
    f.actions
  end
end
