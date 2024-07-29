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
class Image < ApplicationRecord

  # == Extensions ===========================================================
  include ImageUploader.attachment(:file)

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Relationships ========================================================
  belongs_to :imageable, polymorphic: true

  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
