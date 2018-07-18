class Ticket < ApplicationRecord
  belongs_to :manager, foreign_key: :owner_id, optional: true
end
