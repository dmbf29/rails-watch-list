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
      movies = Movie.all.sample(5)
      movies.each do |movie|
        Bookmark.create(
          movie: movie,
          list: list,
          comment: comments.sample
        )
      end
    end
  end
end
