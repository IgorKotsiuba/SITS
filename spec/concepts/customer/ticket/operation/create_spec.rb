require 'rails_helper'

describe Customer::Ticket::Create do
  subject          { described_class.call(params) }
  let(:ticket)     { subject['model'] }
  let(:department) { create :department }

  let(:params) do
    {
      ticket: {
        customer_name:  'Riki',
        customer_email: 'test+1@example.com',
        subject:        'Problem with Cell Phone',
        body:           'I run out of money',
        department_id:  department.id
      }
    }
  end
  before { allow(ReferenceCode).to receive(:generate).and_return('JBS-611-TSY-522-AGX') }

  it { expect(ticket).to be_persisted }
  it { expect(ticket.reference_uuid).to eq 'JBS-611-TSY-522-AGX' }
  it { expect(CustomerMailer.instance_method(:ticket_confirmation)).to be_delayed ticket.id }
end
