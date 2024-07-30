# == Schema Information
#
# Table name: images
#
#  id             :bigint           not null, primary key
#  file_data      :text
#  imageable_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  imageable_id   :bigint           not null
#
# Indexes
#
#  index_images_on_imageable  (imageable_type,imageable_id)
#
class ImageSerializer < ApplicationSerializer

  # == Root Key =============================================================
  root_key :image, :images

  # == Attributes ===========================================================
  attributes :id, :file_url

  # == Relationships ========================================================

  # == Conditionals =========================================================

  # == Transformations ======================================================

  # == Caching ==============================================================

  # == Meta Information =====================================================

  # == Custom Methods =======================================================

end
