module Manager::Ticket
  class Index < Trailblazer::Operation
    step :fetch_collection!
    step :build_search_form!
    step :item_search!

    def fetch_collection!(options, **)
      options['collection'] = ::Ticket.all
    end

    def build_search_form!(options, params:, **)
      model = OpenStruct.new(query: params[:query])
      options['item_search'] = SearchContract.new(model)
    end

    def item_search!(options, item_search:, **)
      return if item_search.query.blank?
      options['ticket_by_query'] = ::Ticket.find_by(reference_uuid: item_search.query)
    end
  end
end
