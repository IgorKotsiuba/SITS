FactoryBot.define do
  factory :message do
    text      'Answer from support team'
    author_id 1
    ticket
  end
end
