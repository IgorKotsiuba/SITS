FactoryBot.define do
  factory :ticket do
    customer_name  'Petro'
    customer_email 'petro@example.com'
    subject        'Problem with TV'
    body           'TV does not support HDCP 2.2'
    sequence(:reference_uuid) { |i| "ABC-#{i}23-DEF-#{i + 1}56-GHI" }
    department
  end
end
