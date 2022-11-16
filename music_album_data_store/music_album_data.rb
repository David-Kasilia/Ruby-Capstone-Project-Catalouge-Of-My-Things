require 'json'

def fetch_data(file)
  file_path = "./data/#{file}.json"
  File.new(file_path, 'w+') unless File.exist?(file_path)
  File.write(file_path, '[]') if File.empty?(file_path)
  contents = File.read(file_path)
  JSON.parse(contents)
end

def update_data(file, data)
  json_data = JSON.generate(data)
  File.write("./data/#{file}.json", json_data)
end

def populate_music_album_list
  fetch_data('music_album').map do |music|
    MusicAlbum.new(music['archived'], music['name'], music['publish_date'])
  end
end

def populate_genre_list
  fetch_data('genre').map do |genre|
    Genre.new(genre['name'])
  end
end
