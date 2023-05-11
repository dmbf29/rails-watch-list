class List < ApplicationRecord
  self.table_name = "watch_l_lists"
  has_many :bookmarks, foreign_key: 'wl_list_id'
  has_many :movies, through: :bookmarks, dependent: :destroy, foreign_key: 'wl_list_id'
  validates :name, uniqueness: true, presence: true
  validates :api_id, uniqueness: { allow_nil: true }
  has_one_attached :photo
end
