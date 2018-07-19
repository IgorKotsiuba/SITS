class Customer::Ticket::MyCreate < Reform::Form
  VALID_EMAIL_REGEX = /[a-z\d_\-.+]+@([a-z\d\-.]+\.)+[a-z]{2,4}/

  property :customer_name
  property :customer_email
  property :subject
  property :department_id
  property :body

  validates :customer_name,  presence: true
  validates :customer_email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :subject,        presence: true
  validates :body,           presence: true
  validates :department_id,  presence: true
end
