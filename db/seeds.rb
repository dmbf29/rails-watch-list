require 'open-uri'

puts "Cleaning DB..."
List.destroy_all
Movie.destroy_all


puts "Calling Movie API..."
json = URI.open('http://tmdb.lewagon.com/movie/top_rated').read
response = JSON.parse(json)
response['results'].each do |movie_hash|
  puts movie_hash['title']
  puts
  Movie.create!(
    title: movie_hash['title'],
    overview: movie_hash['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
    rating: movie_hash['vote_average'].to_f
  )
end
