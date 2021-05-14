require 'open-uri'

puts "Cleaning DB..."
List.destroy_all
Movie.destroy_all

lists = [
  { name: 'Classics', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f3b9.png' },
  { name: 'Horror', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f52a.png' },
  { name: 'Action', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f4a3.png' },
  { name: 'Comedy', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f923.png' },
  { name: 'Romantic', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f618.png' },
  { name: 'Stallone', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f4aa.png' },
  { name: 'Adult', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f346.png' },
  { name: 'Martial Arts', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f94b.png' },
  { name: 'Animated', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f58c.png' },
  { name: 'Epic', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/2694.png' },
  { name: 'Animal', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f408.png' },
  { name: 'Female Leads', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f9b8-2640.png' },
  { name: 'Space Opera', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f680.png' },
  { name: 'Sci-fi', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f47d.png' },
  { name: 'Religious', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f47c.png' },
  { name: 'Drugs', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f92a.png' },
  { name: 'Western', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f920.png' },
  { name: 'Scary', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f47b.png' },
  { name: 'Cerebral', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f92f.png' },
  { name: 'Japanese', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f3ee.png' },
  { name: 'LGBTQ+', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f3f3-1f308.png' },
  { name: 'Thriller', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f575.png' },
  { name: 'Fantasy', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f9d9.png' },
  { name: 'Disaster', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/1f32a.png' },
  { name: 'Travel', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/2708.png' },
  { name: 'Sports', url: 'https://images.emojiterra.com/openmoji/v12.2/128px/26bd.png' }
]

lists = [
  { api_id: 28, name: "Action", url: },
  { api_id: 12, name: "Adventure", url: },
  { api_id: 16, name: "Animation", url: },
  { api_id: 35, name: "Comedy", url: },
  { api_id: 80, name: "Crime", url: },
  { api_id: 99, name: "Documentary", url: },
  { api_id: 18, name: "Drama", url: },
  { api_id: 10751, name: "Family", url: },
  { api_id: 14, name: "Fantasy", url: },
  { api_id: 36, name: "History", url: },
  { api_id: 27, name: "Horror", url: },
  { api_id: 10402, name: "Music", url: },
  { api_id: 9648, name: "Mystery", url: },
  { api_id: 10749, name: "Romance", url: },
  { api_id: 878, name: "Science Fiction", url: },
  { api_id: 10770, name: "TV Movie", url: },
  { api_id: 53, name: "Thriller", url: },
  { api_id: 10752, name: "War", url: },
  { api_id: 37, name: "Western", url: }
]


lists.each do |list_info|
  list = List.create!(name: list_info[:name], api_id: list_info[:api_id])
  puts "Getting photo for #{list_info[:name]}..."
  file = URI.open(list_info[:url])
  list.photo.attach(io: file, filename: 'emoji.png', content_type: 'image/png')
end


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
puts "...Created #{Movie.count} movies"
