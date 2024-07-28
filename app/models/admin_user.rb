# == Schema Information
#
# Table name: admin_users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  surname                :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_admin_users_on_email                 (email) UNIQUE
#  index_admin_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class AdminUser < ApplicationRecord

    # == Extensions ===========================================================
    devise :database_authenticatable, :recoverable, :rememberable, :validatable

    # == Constants ============================================================
  
    # == Attributes ===========================================================
  
    # == Relationships ========================================================
  
    # == Validations ==========================================================
    validates :name, :surname, :email, :encrypted_password, presence: true
    validates :email, uniqueness: true
  
    # == Scopes ===============================================================
  
    # == Callbacks ============================================================
  
    # == Class Methods ========================================================
    def self.ransackable_attributes(auth_object = nil)
      ["email", "name", "surname"]
    end
  
    # == Instance Methods =====================================================

end
