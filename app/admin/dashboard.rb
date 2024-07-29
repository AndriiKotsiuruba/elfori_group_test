# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    section 'Unreviewed invoices' do
      paginated_collection(Invoice.draft.order('id desc').page(params[:page])) do
        table_for(collection) do
          column(:id) { |invoice| link_to(invoice.id, admin_invoice_path(invoice)) }
          column :collection
          column :user
          column :created_at
          column(nil) { |invoice| link_to('View', admin_invoice_path(invoice)) }
        end
      end
    end
  end
end
