class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  validates :name, uniqueness: true, presence: true
  validates :api_id, uniqueness: { allow_nil: true }
  has_one_attached :photo
end
