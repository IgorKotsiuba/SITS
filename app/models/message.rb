class Message < ApplicationRecord
  belongs_to :ticket
  belongs_to :author, class_name: 'Manager', optional: true
end
