class Ticket < ApplicationRecord
  belongs_to :department
  belongs_to :manager, foreign_key: :owner_id, optional: true
  has_many   :messages, dependent: :destroy

  def to_param
    reference_uuid
  end
end
