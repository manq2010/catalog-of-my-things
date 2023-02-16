require_relative './game_ui'
require_relative '../modules/author'

class AuthorUserInterface
    FILE_LOCATION = './data/authors.json'.freeze

    def initialize
        @authors = load(GameUserInterface.new.create_instance_of_game)
    end

    def load(items)
        return [] if File.size(FILE_LOCATION).zero?
        data = JSON.parse(File.read(FILE_LOCATION))
        authors = []
        data.each do |author|
            new_author = Author.new(author['first_name'], author['last_name'])
            authors << new_author

            author['items'].each do |author_id|
                item = items.find {|element| element.id == item_id}
                author.add_item(item) unless item.nil?
            end
        end
        authors
    end

    def list_authors
        @authors.each_with_index do |author, index|
            puts "#{index}) Author Name: #{author.first_name} #{author.last_name}"
        end
    end

    def save(records)
        serialized = []
        records.each do |item|
            serialized << item.to_json
        end
        File.write(FILE_LOCATION, JSON.dump(serialized))
    end

    
end