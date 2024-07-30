module Collections

  class UpdateContract < ApplicationContract

    params do
      required(:title).filled(:string)
      optional(:description).maybe(:string)
      optional(:publish).maybe(Dry::Types()::Params::Bool)

      optional(:images_attributes).array(:hash) do
        optional(:id).filled(:integer)
        required(:file_data).filled(:string)
        optional(:_destroy).filled(:bool)
      end
    end

  end

end
