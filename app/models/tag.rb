class Tag < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }, uniqueness: true
  has_many :taggings, dependent: :destroy
  paginates_per 10
end
