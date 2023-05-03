class Bookmark < ApplicationRecord
  self.table_name = "watch_l_bookmarks"
  belongs_to :movie, foreign_key:"watch_l_movie_id"
  belongs_to :list, foreign_key:"watch_l_list_id"
  validates :movie, uniqueness: { scope: :list }
  validates :comment, length: { minimum: 6 }
end
