class Customer::Ticket::Create < Trailblazer::Operation
  step Nested(::Customer::Ticket::Build)
  step Contract::Validate()
  step Contract::Persist(method: :sync)
  step :persist!
  step :notify_customer!
  failure :log_error!

  def persist!(_options, model:, params:, **)
    model.assign_attributes(params)
    model.reference_uuid = ReferenceCode.generate
    model.save
  rescue ActiveRecord::RecordNotUnique
    retry
  end

  def notify_customer!(_options, model:, **)
    CustomerMailer.delay.ticket_confirmation(model.id)
  end

  def log_error!(_options, **)
  end
end
