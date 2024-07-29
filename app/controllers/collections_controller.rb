class CollectionsController < ApplicationController

  def index
    @collections = Collection.published
  end

  def show
    @collection = Collection.published.includes(:plates).find(params[:id])
    @invoice = @collection.invoices.new
  end

end
