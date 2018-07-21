module Manager::Ticket
  class Show < Trailblazer::Operation
    step :fetch_ticket!

    def fetch_ticket!(options, **)
      options['model'] = ::Ticket.find_by(reference_uuid: options['params'][:reference_uuid])
    end
  end
end
