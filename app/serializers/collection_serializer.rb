# == Schema Information
#
# Table name: collections
#
#  id          :bigint           not null, primary key
#  description :text
#  publish     :boolean
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class CollectionSerializer < ApplicationSerializer

  # == Root Key =============================================================
  root_key :collection, :collections

  # == Attributes ===========================================================
  attributes :id, :title, :description

  # == Relationships ========================================================
  many :plates, resource: PlateSerializer
  many :images, resource: ImageSerializer

  # == Conditionals =========================================================

  # == Transformations ======================================================

  # == Caching ==============================================================

  # == Meta Information =====================================================

  # == Custom Methods =======================================================

end
