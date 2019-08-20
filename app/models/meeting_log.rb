class MeetingLog < ApplicationRecord
  include  SearchCop
  before_validation :day_cannot_future
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  validates :day, presence: true
  validates :place, presence: true, length: { maximum: 150 }
  validates :memo, presence: true, length: { maximum: 150 }
  validates :how, presence: true, length: { maximum: 150 }
  validates :position, presence: true, length: { maximum: 150 }
  validates :status, presence: true
  validates :look, length: { maximum: 300 }
  validates :hometown, length: { maximum: 100 }
  validates :other, length: { maximum: 500 }
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, source: :tag
  has_many :comments, dependent: :destroy
  enum status: { 記憶中: 0, 記憶完了: 1 }
  mount_uploader :image, ImageUploader

  search_scope :search do
    attributes :name
    attributes tag: ["tags.name"]
  end

  private

  def day_cannot_future
    if day.present? && day.future?
      errors.add(:day, " 未来の日付は入力できません")
    end
  end
end
