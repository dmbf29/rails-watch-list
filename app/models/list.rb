class List < ApplicationRecord
  # self.table_name = "watch_l_lists"
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, uniqueness: true, presence: true
  validates :api_id, uniqueness: { allow_nil: true }
  has_one_attached :photo
end
