class List < ApplicationRecord
  self.table_name = "watch_l_lists"
  has_many :bookmarks, foreign_key: "watch_l_bookmark_id", dependent: :destroy
  has_many :movies, foreign_key: "watch_l_movie_id", through: :bookmarks
  validates :name, uniqueness: true, presence: true
  validates :api_id, uniqueness: { allow_nil: true }
  has_one_attached :photo
end
