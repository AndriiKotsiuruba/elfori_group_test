module Collections

  class InvoicesController < ApplicationController

    def create
      command = Invoices::Create.call(params, current_user)

      if command.success?
        redirect_to command.result.collection,
                    notice: t('.success')
      else
        redirect_to command.result,
                    alert: command.errors.full_messages.to_sentence
      end
    end

  end

end
