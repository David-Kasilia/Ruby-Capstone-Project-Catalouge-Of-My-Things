require_relative '../books_class/books'
require_relative '../books_class/label'
require_relative '../books_data_store/books_data'

module BookMethods

    def list_all_books
        if @books.empty?
            puts 'There are no books found in the list!!'
            puts 'Kindly Add Atleast One Book To have a list of books'
        else
            @books.each_with_index do |book, index|
                puts "#{index + 1}, Published By : #{book.publisher}, 
                Published On : #{book.publish_date}
                Book Cover State is: #{book.cover_state}"
            end
        end
    end

    def add_a_book
        puts 'Add a new book'
        print 'Add Book Title: '
        name = gets.chomp
        print 'Add Book Publisher: '
        publisher = gets.chomp
        print 'Enter day of publish book (eg : 2022 Jan 21): '
        publish_date = gets.chomp
        print 'Enter Book Cover state (eg: good, best, bad): '
        cover_state = gets.chomp
        stored_books = fetch_data('books')
        label_selection
        new_book = Books.new(name, publisher, publish_date, cover_state)
        @books << new_book
        book_obj_data = { name: name, publisher: publisher, publish_date: publish_date, cover_state: cover_state }
        stored_books.push(book_obj_data)
        update_data('books', stored_books)
        puts "#{name} Book was added successfully"  
    end

    def label_selection
        if @labels.any?
            print "Enter 'N' to create a new book label or Enter 'S' to select an exixting book label: "
            label_option = gets.chomp.upcase
            case label_option
            when 'N'
                add_a_label
            when 'S'
                puts 'Select a book label from the list by book index: '
                list_all_labels
                selected = gets.chomp
                @labels[selected.to_i]
            else
                puts 'Invalid letter entered'
                puts 'Enter N or S'
            end
        else
            add_a_label
        end
    end

    def add_a_label
        puts 'Add a new label'
        print 'Add Label Title: '
        title = gets.chomp
        print 'Add Label Color: '
        color = gets.chomp
        stored_label = fetch_data('labels')
        new_label = Label.new(title, color)
        @labels << new_label unless @labels.include?(new_label)
        @labels << new_label
        label_obj_data = { title: title, color: color }
        stored_label.push(label_obj_data)
        update_data('labels', stored_label)
        puts "#{title} Book Label was added successfully"  
    end

    def list_all_labels
        if @labels.empty?
            puts 'There are no Labels found in the list!!'
            puts 'Kindly Add Atleast One Label To have a list of books'
        else
            @labels.each_with_index do |label, index|
                puts "#{index + 1}
                Name : #{label.title}
                Color : #{label.color}"
            end
        end
        
    end
    
end