require 'rails_helper'

describe Manager::Ticket::Index do
  subject { described_class.call }
  let(:ticket_1) { create :ticket }
  let(:ticket_2) { create :ticket }

  it { expect(subject['collection']).to match([ticket_1, ticket_2]) }
end
