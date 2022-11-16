require_relative './app'

def main
  app = App.new
  puts 'Welcome to Your Catalogue Application'
  app.load_data
  app.main_menu
end

main
