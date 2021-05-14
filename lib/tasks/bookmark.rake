namespace :bookmark do
  desc 'Adding Movies to Lists'
  task generate_all: :environment do
    comments = [
      'A friend recommended this one.',
      'The critics speak highly of this one.',
      'I can watch this one a million times.',
      'Always wanted to see this one.',
      'Curious if this is any good.'
    ]
    List.find_each do |list|
      # movies = Movie.all.sample(5)
      puts 'Calling Movie API...'
      response = FetchMoviesService.new(list.api_id).call

      response['results'].each do |movie_hash|
        puts movie_hash['title']
        puts
        movie = Movie.create!(
          title: movie_hash['title'],
          overview: movie_hash['overview'],
          poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
          rating: movie_hash['vote_average'].to_f
        )

        Bookmark.create(
          movie: movie,
          list: list,
          comment: comments.sample
        )
      end

      puts "...Created #{Movie.count} movies"
    end
  end
end
