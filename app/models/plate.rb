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
class Plate < ApplicationRecord

  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Relationships ========================================================
  belongs_to :collection, optional: true

  has_one :image, as: :imageable, dependent: :delete

  accepts_nested_attributes_for :image, allow_destroy: true

  # == Validations ==========================================================
  validates :title, presence: true

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
