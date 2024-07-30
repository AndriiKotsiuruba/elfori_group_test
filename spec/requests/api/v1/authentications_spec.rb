require 'swagger_helper'

RSpec.describe '/api/v1/authentication' do
  let(:password) { 'Password1' }
  let(:admin)    { create(:admin_user, password:) }

  path '/api/v1/authentication' do
    post 'Authentication' do
      tags 'Auth'

      description 'Authentication with email and password'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :body, in: :body, required: true, schema: {
        type: :object,
        properties: {
          authentication: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            },
            required: %w[email password]
          }
        },
        required: %w[authentication]
      }

      response(200, 'successful') do
        let(:body) do
          { authentication: { email: admin.email, password: } }
        end

        run_test!
      end

      response(401, 'wrong credential') do
        let(:body) do
          { authentication: { email: :wrong, password: admin.password } }
        end

        run_test! do |response|
          response_body = JSON.parse(response.body)
          expect(response_body['errors']['_base']).to eq(I18n.t('errors.something_went_wrong'))
        end
      end
    end
  end
end
