require 'rails_helper'

describe Manager::Session::CreateContract, type: :contract do
  let!(:properties) { [:username, :password] }
  subject { described_class.new(Struct.new(*properties).new) }

  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:password) }

  describe '#password_ok?' do
    let!(:manager) { create :manager, username: 'Test', password: '123456789' }

    before { subject.validate(params) }

    context 'success' do
      let(:params) { { username: 'Test', password: '123456789' } }
      it { expect(subject.errors[:password]).to be_blank }
    end

    context 'failure' do
      let(:params) { { username: 'Test', password: '11111111' } }
      it { expect(subject.errors[:password]).to eq ['is incorrect'] }
    end
  end
end
