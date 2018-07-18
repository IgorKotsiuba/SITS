class Manager < ApplicationRecord
  has_secure_password

  has_many :tickets, foreign_key: :owner_id
end
