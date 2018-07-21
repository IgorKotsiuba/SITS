require 'rails_helper'

describe Customer::Ticket::Show do
  subject       { described_class.call(params) }
  let!(:ticket) { create :ticket, reference_uuid: 'JBS-611-TSY-522-AGX' }
  let(:params)  { { reference_uuid: 'JBS-611-TSY-522-AGX' } }
  let(:model)   { subject['model'] }

  context 'success' do
    it { expect(model).to eq ticket }
  end

  context 'fail' do
    let(:params) { { reference_uuid: 'CCC-111-BBB-222-AAA' } }

    it 'referance number not found' do
      expect { model }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
