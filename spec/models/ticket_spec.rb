require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { is_expected.to belong_to(:department) }
  it { is_expected.to belong_to(:manager).with_foreign_key(:owner_id) }
end
