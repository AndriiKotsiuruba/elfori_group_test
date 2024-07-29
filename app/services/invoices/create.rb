module Invoices

  class Create < BaseService

    prepend SimpleCommand

    attr_reader :collection, :current_user, :user_attribure

    def initialize(params, current_user)
      @collection = Collection.published.find(params[:collection_id])
      @current_user = current_user
      @user_attribure = params.fetch(:invoice, {}).fetch(:user, {}).permit(:email, :name, :surname)
    end

    def call
      if user.persisted?
        Invoice.create(collection:, user:)
      else
        errors.add(:base, :failure)
        collection
      end
    end

    private

    def user
      @user ||= current_user || find_user || create_user
    end

    def find_user
      User.find_by(email: user_attribure[:email].downcase)
    end

    def create_user
      User.create(user_attribure_with_password)
    end

    def user_attribure_with_password
      password = Devise.friendly_token.first(6)
      user_attribure.merge(password:, password_confirmation: password)
    end

  end

end
