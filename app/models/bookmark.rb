class Bookmark < ApplicationRecord
  # self.table_name = "watch_l_bookmarks"
  belongs_to :movie
  belongs_to :list
  validates :movie, uniqueness: { scope: :list }
  validates :comment, length: { minimum: 6 }
end
