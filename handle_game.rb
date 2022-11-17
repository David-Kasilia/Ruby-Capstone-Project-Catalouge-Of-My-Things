require 'json'
require 'date'
require_relative './game'
require_relative './author'

module HandleGame
  def add_a_game
    print 'Is the game multiplayer? (Y/N): '
    multiplayer = gets.chomp.downcase == 'y' || false
    print 'Last played at: [enter date in YYYY-MM-DD format]: '
    publish_date = Date.parse(gets.chomp)
    return unless publish_date

    print 'When the game was last played at: [enter date in YYYY-MM-DD format]: '
    last_played_at = Date.parse(gets.chomp)
    return unless last_played_at

    @games.push(Game.new(multiplayer, publish_date, last_played_at, archived: false))
    puts 'Game added successfully'

    print 'Do you want to add an author? (Y/N): '
    add_author if gets.chomp.downcase == 'y'
    puts 'Game added successfully'
  end

  def add_author
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    @authors.push(Author.new(first_name, last_name))
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
