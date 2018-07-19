class Ticket < ApplicationRecord
  belongs_to :manager, foreign_key: :owner_id, optional: true

  def to_param
    reference_uuid
  end
end
