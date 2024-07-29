# == Schema Information
#
# Table name: invoices
#
#  id            :bigint           not null, primary key
#  status        :integer          default("draft")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  collection_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_invoices_on_collection_id  (collection_id)
#  index_invoices_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (collection_id => collections.id)
#  fk_rails_...  (user_id => users.id)
#
class Invoice < ApplicationRecord

  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================
  enum status: { draft: 0, processing: 1, complited: 2 }

  # == Relationships ========================================================
  belongs_to :collection
  belongs_to :user

  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
