class Tag < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  has_many :taggings, dependent: :destroy
  paginates_per 10
end
