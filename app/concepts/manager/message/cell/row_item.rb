module Manager::Message::Cell
  class RowItem < Trailblazer::Cell
    property :text
    property :created_at

    def author_name
      model.author&.username || model.ticket.customer_name
    end

    def formated_time
      model.created_at.strftime('%H:%M %Y-%m-%d')
    end
  end
end
