class BuildPopularMoviesService

  def call
    query = { 'api_key' => ENV['MOVIE_API'] }
    headers = {
      'Authorization' => "Bearer #{ENV['MOVIE_TOKEN']}",
      'Content-Type' => 'application/json;charset=utf-8'
    }
    response = HTTParty.get(
      'https://api.themoviedb.org/3/discover/movie',
      query: query,
      headers: headers
    )
    response['results'].map do |movie_hash|
      Movie.where(
        title: movie_hash['title'],
        overview: movie_hash['overview'],
        poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
        rating: movie_hash['vote_average'].to_f
      ).first_or_create
    end
  end
end
