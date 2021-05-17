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
      movie = Movie.find_by(title: movie_hash['title'])
      if movie
        movie.update(
          title: movie_hash['title'],
          overview: movie_hash['overview'],
          poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
          rating: movie_hash['vote_average'].to_f
        )
        movie
      else
        movie = Movie.create(
          title: movie_hash['title'],
          overview: movie_hash['overview'],
          poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
          rating: movie_hash['vote_average'].to_f
        )
        movie
      end
    end
  end
end
