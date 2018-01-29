class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 400 }
  validates :reply_id, presence: true
end
