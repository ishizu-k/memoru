class Tag < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }, uniqueness: true
  has_many :taggings, dependent: :destroy
end
