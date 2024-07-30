# frozen_string_literal: true

module CollectionsControllerHelper
  def back_link
    link_to 'Back to Collections', collections_path, class: "nav-link" if action_name.eql?('show')
  end

  def instagram_link(label)
    link_to label, INSTAGRAM_LINK, class: "nav-link"
  end

  def facebook_link(label)
    link_to label, FACEBOOK_LINK, class: "nav-link"
  end
end