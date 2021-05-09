class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :title, uniquness: true, presence: true
end
