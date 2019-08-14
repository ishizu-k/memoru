class Tag < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
end
