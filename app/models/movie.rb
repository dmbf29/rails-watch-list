class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  validates :title, uniqueness: true, presence: true
end

# {{
# "genres": [
#     {
#         api_id: 28,
#         name: "Action",
#         url:
#     },
#     {
#         api_id: 12,
#         name: "Adventure",
#         url:
#     },
#     {
#         api_id: 16,
#         name: "Animation",
#         url:
#     },
#     {
#         api_id: 35,
#         name: "Comedy",
#         url:
#     },
#     {
#         api_id: 80,
#         name: "Crime",
#         url:
#     },
#     {
#         api_id: 99,
#         name: "Documentary",
#         url:
#     },
#     {
#         api_id: 18,
#         name: "Drama",
#         url:
#     },
#     {
#         api_id: 10751,
#         name: "Family",
#         url:
#     },
#     {
#         api_id: 14,
#         name: "Fantasy",
#         url:
#     },
#     {
#         api_id: 36,
#         name: "History",
#         url:
#     },
#     {
#         api_id: 27,
#         name: "Horror",
#         url:
#     },
#     {
#         api_id: 10402,
#         name: "Music",
#         url:
#     },
#     {
#         api_id: 9648,
#         name: "Mystery",
#         url:
#     },
#     {
#         api_id: 10749,
#         name: "Romance",
#         url:
#     },
#     {
#         api_id: 878,
#         name: "Science Fiction",
#         url:
#     },
#     {
#         api_id: 10770,
#         name: "TV Movie",
#         url:
#     },
#     {
#         api_id: 53,
#         name: "Thriller",
#         url:
#     },
#     {
#         api_id: 10752,
#         name: "War",
#         url:
#     },
#     {
#         api_id: 37,
#         name: "Western",
#         url:
#     }
# ]
# }}
