class CustomerMailer < ApplicationMailer
  def ticket_confirmation(ticket_id)
    @ticket = Ticket.find(ticket_id)
    mail to: @ticket.customer_email, subject: 'Ticket Request Confirmation'
  end
end
