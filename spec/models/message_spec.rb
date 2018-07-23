require 'rails_helper'

RSpec.describe Message, type: :model do
  it { is_expected.to belong_to(:ticket) }
  it { is_expected.to belong_to(:author).class_name('Manager') }
end
