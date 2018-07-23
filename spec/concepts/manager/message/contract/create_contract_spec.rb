require 'rails_helper'

describe Manager::Message::CreateContract, type: :contract do
  let!(:properties) { [:text] }
  subject { described_class.new(Struct.new(*properties).new) }

  it { is_expected.to validate_presence_of(:text) }
end
