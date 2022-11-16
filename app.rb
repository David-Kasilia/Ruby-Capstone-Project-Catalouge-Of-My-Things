require_relative './main_menu_class/main_menu' 
require_relative './music_album'
require_relative './genre'
require_relative './music_module/music_module'

class App
    include MainMenu
    include MusicModule

    attr_accessor :music_albums, :genres

    def initialize
        @music_albums = []
        @genres = []
    end
end

