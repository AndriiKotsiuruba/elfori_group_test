module Collections

  class Update

    include BaseService

    attr_reader :collection, :collection_params

    def initialize(collection, collection_params)
      @collection = collection
      @collection_params = collection_params
    end

    def call
      with_contract(UpdateContract.new, collection_params) do |_attributes|
        return unless collection.update(collection_params)

        collection
      end
    end

  end

end
