module Collections

  class Create

    include BaseService

    attr_reader :collection_params

    def initialize(collection_params)
      @collection_params = collection_params
    end

    def call
      with_contract(CreateContract.new, collection_params) do |attributes|
        collection = Collection.new(attributes)

        return unless collection.save

        collection
      end
    end

  end

end
