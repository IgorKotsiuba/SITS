module Manager::Ticket
  class Update < Trailblazer::Operation
    step Nested(Show)
    step Contract::Validate(key: :message, name: 'message')
    step :sync_message!
    step :attach_message_to_ticket!
    step :attach_author_to_message!
    step :save_message!
    step :save_ticket!
    step :notify_customer!

    def sync_message!(options, *)
      options['message'] = options['contract.message'].sync
    end

    def attach_message_to_ticket!(_options, model:, message:, **)
      message.ticket = model
    end

    def attach_author_to_message!(_options, current_manager:, message:, **)
      message.author = current_manager
    end

    def save_message!(_options, message:, **)
      message.save
    end

    def save_ticket!(_options, model:, **)
      model.save
    end

    def notify_customer!(_options, message:, **)
      CustomerMailer.delay.ticket_notification(message.id)
    end
  end
end
