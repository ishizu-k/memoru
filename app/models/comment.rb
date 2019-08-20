class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 1000 }
  belongs_to :meeting_log
end
