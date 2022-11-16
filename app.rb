require_relative './books_class/books'
require_relative './books_class/label'
require_relative './books_data_store/books_data'
require_relative './book_module/book_module'
require_relative './main_menu_class/main_menu'
require_relative './music_album'
require_relative './genre'
require_relative './music_module/music_module'
require_relative './music_album_data_store/music_album_data'

class App
  include MainMenu
  include BookMethods
  include MusicModule
  attr_accessor :books, :labels, :music_albums, :genres

  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genres = []
  end

  def load_data
    @books = populate_book_list
    @labels = populate_label_list
    @music_albums = populate_music_album_list
    @genres = populate_genre_list
  end
end
