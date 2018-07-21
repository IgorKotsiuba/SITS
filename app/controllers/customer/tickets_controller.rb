module Customer
  class TicketsController < ApplicationController
    def new
      run Ticket::Build
      render concept(Ticket::Cell::New, @form)
    end

    def create
      run Ticket::Create do
        return redirect_to @model
      end

      render concept(Ticket::Cell::New, @form)
    end

    def show
      run Ticket::Show
      render concept(Ticket::Cell::Show, @model)
    end

    def permited_params
      params.require(:ticket).permit(:customer_name, :customer_email, :subject, :body, :department_id)
    end
  end
end
