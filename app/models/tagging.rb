class Tagging < ApplicationRecord
  belongs_to :meeting_log
  belongs_to :tag
end
