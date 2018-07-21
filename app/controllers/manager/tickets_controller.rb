class Manager::TicketsController < Manager::BaseController
  before_action :authenticate_manager!

  def index
    run ::Manager::Ticket::Index
    render concept(::Manager::Ticket::Cell::Index, OpenStruct.new(collection: result['collection']))
  end

  def show
    run ::Manager::Ticket::Show
    render concept(::Manager::Ticket::Cell::Show, @model)
  end
end
