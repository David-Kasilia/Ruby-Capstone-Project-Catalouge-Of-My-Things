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

def populate_book_list
  fetch_data('books').map do |book|
    Books.new(book['name'], book['publisher'], book['publish_date'], book['cover_state'])
  end
end

def populate_label_list
  fetch_data('labels').map do |label|
    Label.new(label['name'], label['color'])
    Label.new(label['title'], label['color'])
  end
end
