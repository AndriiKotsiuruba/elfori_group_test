require 'rails_helper'

RSpec.describe '/api/v1/collections' do
  let!(:collection)   { create(:collection) }

  let(:admin)         { create(:admin_user) }
  let(:Authorization) { JsonWebToken.encode(admin.token_payload) }

  path '/api/v1/collections' do
    get 'All collections' do
      tags 'Collections'

      security [jwt: []]

      consumes 'application/json'
      produces 'application/json'

      response(200, 'successful') do
        run_test! do |response|
          response_body = JSON.parse(response.body)
          count_collections = Collection.published.count
          response_collections_count = response_body.count
          expect(count_collections).to eq(response_collections_count)
        end
      end
    end

    post 'Create collections' do
      tags 'Collections'

      security [jwt: []]

      consumes 'application/json'
      produces 'application/json'

      parameter name: :body, in: :body, required: true, schema: {
        type: :object,
        properties: {
          collection: {
            type: :object,
            properties: {
              title: { type: :string },
              description: { type: :string },
              publish: { type: :boolean },
              images_attributes: {
                type: :object,
                properties: {
                  id: { type: :integer },
                  file_data: { type: :string },
                  _destroy: { type: :boolean }
                },
                required: %w[title]
              }
            },
            required: %w[title]
          }
        },
        required: %w[collection]
      }

      response(200, 'there are cart items and draft orders') do
        let(:body) do
          {
            collection: {
              title: 'Test',
              publish: true
            }
          }
        end

        run_test!
      end

      response(406, 'not_acceptable') do
        let(:body) do
          {
            collection: {
              title: ''
            }
          }
        end

        run_test! do |response|
          response_body = JSON.parse(response.body)
          expect(response_body['errors']['title']).to eq('Title must be filled')
        end
      end
    end
  end

  path '/api/v1/collections/{collection_id}' do
    get 'Get collection' do
      tags 'Collections'

      security [jwt: []]

      consumes 'application/json'
      produces 'application/json'

      parameter name: :collection_id, in: :path, type: :integer

      response(200, 'successful') do
        let(:collection_id) { collection.id }

        run_test! do |response|
          aggregate_failures 'response' do
            response_body = JSON.parse(response.body)
            expect(response_body['id']).to eq(collection.id)
          end
        end
      end

      response(404, 'not_found') do
        let(:collection_id) { :invalid }

        run_test! do |response|
          response_body = JSON.parse(response.body)
          expect(response_body['error']).to eq(I18n.t('errors.something_went_wrong'))
        end
      end
    end

    put 'Update collection' do
      tags 'Collections'

      security [jwt: []]

      consumes 'application/json'
      produces 'application/json'

      parameter name: :collection_id, in: :path, type: :integer

      parameter name: :body, in: :body, required: true, schema: {
        type: :object,
        properties: {
          collection: {
            type: :object,
            properties: {
              title: { type: :string },
              description: { type: :string },
              publish: { type: :boolean },
              images_attributes: {
                type: :object,
                properties: {
                  id: { type: :integer },
                  file_data: { type: :string },
                  _destroy: { type: :boolean }
                },
                required: %w[title]
              }
            },
            required: %w[title]
          }
        },
        required: %w[collection]
      }

      response(200, 'successful') do
        let(:collection_id) { collection.id }

        let(:body) do
          {
            collection: {
              title: 'Test',
              publish: false
            }
          }
        end

        run_test! do |response|
          aggregate_failures 'response' do
            response_body = JSON.parse(response.body)
            expect(response_body['id']).to eq(collection.id)
          end
        end
      end

      response(406, 'not_acceptable') do
        let(:collection_id) { collection.id }

        let(:body) do
          {
            collection: {
              title: ''
            }
          }
        end

        run_test! do |response|
          response_body = JSON.parse(response.body)
          expect(response_body['errors']['title']).to eq('Title must be filled')
        end
      end

      response(404, 'not_found') do
        let(:collection_id) { :invalid }

        run_test! do |response|
          response_body = JSON.parse(response.body)
          expect(response_body['error']).to eq(I18n.t('errors.something_went_wrong'))
        end
      end
    end

    delete 'Delete collection' do
      tags 'Collections'

      security [jwt: []]

      consumes 'application/json'
      produces 'application/json'

      parameter name: :collection_id, in: :path, type: :integer

      response(200, 'successful') do
        let(:collection_id) { collection.id }

        run_test! do |response|
          aggregate_failures 'response' do
            response_body = JSON.parse(response.body)
            expect(response_body['message']).to eq(I18n.t('collections.deleted'))
          end
        end
      end

      response(404, 'not_found') do
        let(:collection_id) { :invalid }

        run_test! do |response|
          response_body = JSON.parse(response.body)
          expect(response_body['error']).to eq(I18n.t('errors.something_went_wrong'))
        end
      end
    end
  end
end
