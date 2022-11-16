require_relative '../music_album'
require_relative '../genre'
require_relative '../music_album_data_store/music_album_data'

module MusicModule
  def add_a_music_album
    puts 'enter [y/n] to say yes for archived: '
    answer = gets.chomp
    archived = answer == 'y'

    puts 'enter name: '
    name = gets.chomp

    puts "enter publish date in 'yyyy-mm-dd' format: "
    publish_date = gets.chomp

    store_music = fetch_data('music_album')

    select_genre

    to_add = MusicAlbum.new(archived, name, publish_date)
    @music_albums << to_add
    music_obj_data = { archived: archived, name: name, publish_date: publish_date }
    store_music.push(music_obj_data)
    update_data('music_album', store_music)
    puts 'Music Added Succesfully'
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'There are not any in the list, add atleast one music album'
    else
      @music_albums.each_with_index do |music_album, index|
        puts "S.NO: #{index + 1}
                name:#{music_album.name}
                publish_date: #{music_album.publish_date}
                on_spotify: #{music_album.on_spotify}
                is_archived: #{music_album.archived}"
      end
    end
  end

  def select_genre
    if @genres.any?
      print "Enter 'S' to Select any existing Genre or 'N' to Create a New Genre"
      genre_option = gets.chomp.upcase
      case genre_option
      when 'N'
        add_a_genre
      when 'S'
        puts 'Select a Music Genre from the list below by index'
        list_all_genres
        selected = gets.chomp.to_i
        @genres[selected]
      else
        puts "Invalid Letter Entered, please select 'N' or 'S'"
      end
    else
      add_a_genre
    end
  end

  def add_a_genre
    puts 'Add a new Genre'
    print 'Add a Genre Name: '
    name = gets.chomp
    store_genre = fetch_data('genre')
    new_genre = Genre.new(name)
    @genres << new_genre unless @genres.include?(new_genre)
    genre_obj_data = { name: name }
    store_genre.push(genre_obj_data)
    update_data('genre', store_genre)
    puts 'Genre was added successfully'
  end

  def list_all_genres
    if @genres.empty?
      puts 'There are no Genres yet, add one now'
    else
      @genres.each_with_index do |genres, index|
        puts "S.No: #{index + 1}
                Genre: #{genres.name}"
      end
    end
  end
end
