# == Schema Information
#
# Table name: plates
#
#  id            :bigint           not null, primary key
#  order         :integer
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  collection_id :bigint
#
# Indexes
#
#  index_plates_on_collection_id  (collection_id)
#
# Foreign Keys
#
#  fk_rails_...  (collection_id => collections.id)
#
class PlateSerializer < ApplicationSerializer

  # == Root Key =============================================================
  root_key :plate, :plates

  # == Attributes ===========================================================
  attributes :id, :title, :order

  # == Relationships ========================================================
  one :image, resource: ImageSerializer

  # == Conditionals =========================================================

  # == Transformations ======================================================

  # == Caching ==============================================================

  # == Meta Information =====================================================

  # == Custom Methods =======================================================

end
