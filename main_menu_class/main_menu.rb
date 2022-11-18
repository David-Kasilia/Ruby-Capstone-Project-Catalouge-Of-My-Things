require_relative './main_menu_options'

module MainMenu
  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def main_menu
    MainMenuOptions.main_menu_options
    menu_option = gets.chomp.to_i
    case menu_option
    when 1
      list_all_books
    when 2
      list_all_music_albums
    when 3
      list_games
    when 4
      list_all_genres
    when 5
      list_all_labels
    when 6
      list_authors
    when 7
      add_author
    when 8
      add_a_book
    when 9
      add_a_music_album
    when 10
      add_a_label
    when 11
      add_a_game
    when 12
      puts 'All catalogue data has been saved'
      puts 'Thank you for using your catalogue'
      exit
    else
      puts 'Invalid selection'
      puts 'Please enter a valid number between 1 - 12 or 13 to exit the application'
    end
    main_menu
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
end
