module Manager::Ticket::Cell
  class Show < Trailblazer::Cell
    property :reference_uuid
    property :subject
    property :body
    property :customer_name
    property :customer_email
    property :created_at

    def department
      model.department.name
    end

    def message_form
      OpenStruct.new(contract: options[:contract_message], url: model)
    end

    def messages
      model.messages.includes(:author).order(created_at: :desc)
    end
  end
end
