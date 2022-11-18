require 'json'
require 'date'
require_relative './game'
require_relative './author'
require_relative './games_data_store/games_data'

module HandleGame
  # rubocop:disable Metrics/MethodLength
  def add_a_game
    puts 'Enter the name of the game:'
    name = gets.chomp
    print 'Is the game multiplayer? (Y/N): '
    multiplayer = gets.chomp.downcase == 'y' || false
    print 'Last played at: [enter date in YYYY-MM-DD format]: '
    publish_date = Date.parse(gets.chomp)
    return unless publish_date

    print 'When the game was last played at: [enter date in YYYY-MM-DD format]: '
    last_played_at = Date.parse(gets.chomp)
    return unless last_played_at

    print 'Is the game Archived? (Y/N): '
    archived = gets.chomp.downcase == 'y' || false
    store_games = fetch_data('games')
    new_game = Game.new(name, multiplayer, publish_date, last_played_at, archived)
    @games << new_game
    games_obj_data = { name: name, multiplayer: multiplayer, publish_date: publish_date,
                       last_played_at: last_played_at, archived: archived }
    store_games << games_obj_data
    update_data('games', store_games)
    puts 'Game added successfully'
    print 'Do you want to add an author? (Y/N): '
    add_author if gets.chomp.downcase == 'y'
    puts 'Author added successfully'
  end

  # rubocop:enable Metrics/MethodLength
  def add_author
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    store_authors = fetch_data('authors')
    new_author = Author.new(first_name, last_name)
    @authors << new_author
    authors_obj_data = { first_name: first_name, last_name: last_name }
    store_authors << authors_obj_data
    update_data('authors', store_authors)
    puts 'Author added successfully'
  end

  def list_games
    @games.each do |game|
      puts "Game: #{game.name}"
      puts "Multiplayer: #{game.multiplayer}"
      puts "Last played at: #{game.last_played_at}"
      puts "Publish date: #{game.publish_date}"
    end
  end

  def list_authors
    @authors.each do |author|
      puts "Author: #{author.first_name} #{author.last_name}"
    end
  end
end
