module Manager::Ticket::Cell
  class RowItem < Trailblazer::Cell
    property :reference_uuid
    property :subject
    property :updated_at
    property :customer_name
    property :customer_email

    def owner
      model.manager&.username
    end
  end
end
