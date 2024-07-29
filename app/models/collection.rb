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
class Collection < ApplicationRecord

  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Relationships ========================================================
  has_many :images, as: :imageable, dependent: :delete_all
  has_many :plates, dependent: :nullify
  has_many :invoices, dependent: :delete_all

  accepts_nested_attributes_for :images, allow_destroy: true

  # == Validations ==========================================================
  validates :title, presence: true

  # == Scopes ===============================================================
  scope :published, -> { where(publish: true) }

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
