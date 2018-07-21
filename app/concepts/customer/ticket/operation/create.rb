module Customer::Ticket
  class Create < Trailblazer::Operation
    step Nested(Build)
    step Contract::Validate(key: :ticket)
    step Contract::Persist(method: :sync)
    step :persist!
    step :notify_customer!

    def persist!(_options, model:, **)
      model.reference_uuid = ReferenceCode.generate
      model.save
    rescue ActiveRecord::RecordNotUnique
      retry
    end

    def notify_customer!(_options, model:, **)
      CustomerMailer.delay.ticket_confirmation(model.id)
    end
  end
end
