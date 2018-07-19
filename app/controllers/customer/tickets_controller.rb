class Customer::TicketsController < ApplicationController
  def new
    run Customer::Ticket::Build
    render concept(Customer::Ticket::Cell::New, OpenStruct.new(contract: @form))
  end

  def create
    # DOESNT WORK YET
    # run Customer::Ticket::Create do
    #   return redirect_to @model
    # end
    result = Customer::Ticket::Create.call(permited_params)

    return redirect_to result['model'] if result.success?
    render concept(Customer::Ticket::Cell::New, OpenStruct.new(contract: @form))
  end

  def show
    run Customer::Ticket::Show
    render concept(Customer::Ticket::Cell::Show, @model)
  end

  def permited_params
    params.require(:ticket).permit(:customer_name, :customer_email, :subject, :body, :department_id)
  end
end
