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
  end
end
