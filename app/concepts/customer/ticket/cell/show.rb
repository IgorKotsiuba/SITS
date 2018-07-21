module Customer::Ticket::Cell
  class Show < Trailblazer::Cell
    property :customer_name
    property :customer_email
    property :reference_uuid
    property :subject
    property :body
    property :created_at
  end
end
