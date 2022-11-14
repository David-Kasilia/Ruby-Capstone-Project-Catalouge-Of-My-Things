require_relative './main_menu_options'

class MainMenu
    def main_menu
        MainMenuOptions.main_menu_options
        menu_option = gets.chomp.to_i
        case menu_option
        when 1
            list_all_books
        when 2
            list_all_music_albums
        when 3
            list_all_movies
        when 4
            list_of_games
        when 5
            list_all_genres
        when 6
            list_all_labels
        when 7
            list_all_authors
        when 8
            list_all_sources
        when 9
            add_a_book
        when 10
            add_a_music_album
        when 11
            add_a_movie
        when 12
            add_a_game
        when 13
            puts 'All catalogue data has been saved'
            exit
        else
            puts 'Invalid selection'
            puts 'Please enter a valid number between 1 - 12'
        end

    end
    
end