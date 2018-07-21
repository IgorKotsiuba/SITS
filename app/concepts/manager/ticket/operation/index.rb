module Manager::Ticket
  class Index < Trailblazer::Operation
    step :fetch_collection!

    def fetch_collection!(options, **)
      options['collection'] = ::Ticket.all
    end
  end
end
