require_relative '../modules/genre'
class GenreUserInterface
  attr_accessor :genres

  def initialize
    @genres = []
  end

  def list_all_genres
    puts ['No genres found', ''] if @genres.empty?

    @genres.each do |genre|
      puts "Name: #{genre.name}"
    end
  end
end
