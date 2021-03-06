class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true
  has_many :meeting_logs, dependent: :destroy
  has_many :tags, dependent: :destroy
  mount_uploader :image, ImageUploader
end
