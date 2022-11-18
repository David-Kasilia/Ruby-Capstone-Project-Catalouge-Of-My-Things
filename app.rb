require_relative './books_class/books'
require_relative './books_class/label'
require_relative './books_data_store/books_data'
require_relative './book_module/book_module'
require_relative './main_menu_class/main_menu'
require_relative './music_album'
require_relative './genre'
require_relative './music_module/music_module'
require_relative './music_album_data_store/music_album_data'
require_relative './handle_game'
require_relative './games_data_store/games_data'

class App
  include MainMenu
  include BookMethods
  include MusicModule
  include HandleGame
  attr_accessor :books, :labels, :music_albums, :genres, :games, :authors

  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genres = []
    @games = []
    @authors = []
  end

  def load_data
    @books = populate_book_list
    @labels = populate_label_list
    @music_albums = populate_music_album_list
    @genres = populate_genre_list
    @games = populate_games_list
    @authors = populate_authors_list
  end
end
