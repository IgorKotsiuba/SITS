class Customer::Ticket::Show < Trailblazer::Operation
  step :find_ticket!

  def find_ticket!(options, params:, **)
    options['model'] = ::Ticket.find_by(reference_uuid: params[:reference_uuid])
  end
end
