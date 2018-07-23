class CustomerMailer < ApplicationMailer
  def ticket_confirmation(ticket_id)
    @ticket = Ticket.find(ticket_id)
    mail to: @ticket.customer_email, subject: 'Ticket Request Confirmation'
  end

  def ticket_notification(message_id)
    @message = Message.find(message_id)
    @ticket  = @message.ticket
    mail to: @ticket.customer_email, subject: 'Ticket Request Notification'
  end
end
