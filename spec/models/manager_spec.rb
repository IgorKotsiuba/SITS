require 'rails_helper'

RSpec.describe Manager, type: :model do
  it { is_expected.to have_many(:tickets).with_foreign_key(:owner_id) }
end
