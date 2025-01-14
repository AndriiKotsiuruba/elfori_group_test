require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.openapi_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: 'http://{defaultHost}',
          variables: {
            defaultHost: {
              default: ENV.fetch('APP_URL')
            }
          }
        },
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: ENV.fetch('APP_URL')
            }
          }
        }
      ],
      components: {
        securitySchemes: {
          jwt: {
            type: :apiKey,
            name: 'Authorization',
            in: :header
          }
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.openapi_format = :yaml

  config.after do |example|
    if respond_to?(:response) && response&.body.present?
      content = example.metadata[:response][:content] || {}
      value   = JSON.parse(response.body, symbolize_names: true)

      description  = example.full_description.split.from(3).join(' ')
      example_spec = {
        'application/json' => {
          examples: {
            description => {
              value:
            }
          }
        }
      }
      example.metadata[:response][:content] = content.deep_merge(example_spec)
    end
  end
end
