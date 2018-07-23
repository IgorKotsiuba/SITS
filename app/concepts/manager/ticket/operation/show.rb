require_dependency 'app/concepts/manager/message/operation/build'

module Manager::Ticket
  class Show < Trailblazer::Operation
    step :fetch_ticket!
    step Nested(::Manager::Message::Build, output: ->(_options, mutable_data:, **) do
      {
        'contract.message' => mutable_data['contract.default'],
        'message' => mutable_data['model']
      }
    end)

    def fetch_ticket!(options, **)
      options['model'] = ::Ticket.find_by(reference_uuid: options['params'][:reference_uuid])
    end
  end
end
