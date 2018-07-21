require 'rails_helper'

describe Manager::Ticket::Show do
  subject { described_class.call(params) }
  let!(:ticket_1) { create :ticket }
  let!(:ticket_2) { create :ticket, reference_uuid: 'AAA-111-BBB-222-CCC' }

  context 'success' do
    let!(:params) { { reference_uuid: ticket_1.reference_uuid } }

    it { expect(subject['model']).to eq ticket_1 }
  end

  context 'fail' do
    let!(:params) { { reference_uuid: 'AAA-111-BBB-222-XXX' } }

    it { expect(subject['model']).to eq nil }
  end
end
