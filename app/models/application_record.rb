# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base

  # == Extensions ===========================================================

  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Relationships ========================================================

  # == Validations ==========================================================

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================
  self.abstract_class = true

  def self.ransackable_associations(_auth_object = nil)
    @ransackable_associations ||= reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def self.ransackable_attributes(_auth_object = nil)
    @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
  end

  # == Instance Methods =====================================================

end
