class Manager::TicketsController < Manager::BaseController
  before_action :authenticate_manager!

  def index
    run ::Manager::Ticket::Index

    return redirect_to [:manager, result['ticket_by_query']] if result['ticket_by_query'].present?
    render concept(::Manager::Ticket::Cell::Index,
                   OpenStruct.new(item_search: result['item_search'],
                                  collection: result['collection']))
  end

  def show
    run ::Manager::Ticket::Show
    render concept(::Manager::Ticket::Cell::Show, @model)
  end
end
