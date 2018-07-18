FactoryBot.define do
  factory :ticket do
    customer_name  'Petro'
    customer_email 'petro@example.com'
    department_id  1
    subject        'Problem with TV'
    body           'TV does not support HDCP 2.2'
    reference_uuid 'ABC-123-DEF-456-GHI'
  end
end
