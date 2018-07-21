require 'rails_helper'

describe Customer::Ticket::CreateContract, type: :contract do
  let!(:properties) { [:customer_name, :customer_email, :subject, :department_id, :body] }
  subject { described_class.new(Struct.new(*properties).new) }

  it { is_expected.to validate_presence_of(:customer_name) }
  it { is_expected.to validate_presence_of(:customer_email) }
  it { is_expected.to validate_presence_of(:subject) }
  it { is_expected.to validate_presence_of(:department_id) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to allow_values('email@example.com', 'email+1@example.ca').for(:customer_email) }
  it { is_expected.not_to allow_values('email@example', 'email@.ca').for(:customer_email) }
end
