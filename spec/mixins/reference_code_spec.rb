require 'rails_helper'

describe ReferenceCode do
  describe '#generate' do
    it { expect(described_class.generate).to match(/[A-Z]{3}-\d{3}-[A-Z]{3}-\d{3}-[A-Z]{3}/) }
  end
end
