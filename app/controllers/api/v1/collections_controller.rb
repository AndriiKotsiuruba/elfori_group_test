module Api

  module V1

    class CollectionsController < ApiController

      def index
        json_response(CollectionSerializer.new(Collection.published).serializable_hash)
      end

      def show
        collection = Collection.published.find(params[:id])

        json_response(CollectionSerializer.new(collection).serializable_hash)
      end

      def create
        command = Collections::Create.call(params[:collection].to_unsafe_hash)

        if command.success?
          json_response(CollectionSerializer.new(command.result).serializable_hash)
        else
          json_response(serialized_errors(command.errors), :not_acceptable)
        end
      end

      def update
        collection = Collection.find(params[:id])
        command = Collections::Update.call(collection, params[:collection].to_unsafe_hash)

        if command.success?
          json_response(CollectionSerializer.new(command.result).serializable_hash)
        else
          json_response(serialized_errors(command.errors), :not_acceptable)
        end
      end

      def destroy
        collection = Collection.find(params[:id])

        if collection.destroy
          json_response(message: I18n.t('collections.deleted'))
        else
          json_response(serialized_errors(command.errors), :unprocessable_entity)
        end
      end

    end

  end

end
