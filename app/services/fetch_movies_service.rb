class FetchMoviesService
  attr_reader :genre_id

  def initialize(genre_id)
    @genre_id = genre_id
  end

  def call
    query = {
      'api_key' => ENV['MOVIE_API'],
      'with_genres' => genre_id
    }
    headers = {
      'Authorization' => "Bearer #{ENV['MOVIE_TOKEN']}",
      'Content-Type' => 'application/json;charset=utf-8'
    }
    HTTParty.get(
      'https://api.themoviedb.org/3/discover/movie',
      query: query,
      headers: headers
    )
  end
end
