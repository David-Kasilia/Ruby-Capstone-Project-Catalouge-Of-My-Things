require_relative './books_class/books'
require_relative './books_class/label'
require_relative './books_data_store/books_data'
require_relative './book_module/book_module'
require_relative './main_menu_class/main_menu'

class App
    include MainMenu
    include BookMethods
    attr_accessor :books, :labels

    def initialize
        @books = []
        @labels = []  
    end

    def load_data
        @books = populate_book_list
        @labels = populate_label_list
    end

end