require './book'
require './person'
require './teacher'
require './student'
require 'date'


class App
  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  # get user input method
  def get_user_input(text, field)
    puts text
    field = gets.chomp
    return field
  end

  # create class object method
  def create_object(class_Name, store, *args)
    class_Name.new(*args)
    store.push(class_Name.new(*args))
  end

  # create book method
  def create_a_book
    puts 'Create a new book'
    title = get_user_input("Enter a new title", title)
    author = get_user_input("Enter an author", author)
    create_object(Book, @books, title, author)
  end

  def list_all_books
    puts 'There are currently no books! press 4 to create a book' if @books.empty?
    @books.map.with_index { |book, index| puts "#{index}) Title: #{book.title} - Author: #{book.author}" }
  end

  def create_a_student
    puts 'Create a student'
    id = get_user_input('Enter student id', id)
    age = get_user_input('Enter student age', age)
    name = get_user_input('Enter student name', name) 
    parent_permission = get_user_input('Enter parent permission: true or false', parent_permission)
    create_object(Student, @people, id, age, name, parent_permission)
  end

  def create_a_teacher
    puts "Create a tacher"
    id = get_user_input('Enter teacher id', id)
    age = get_user_input('Enter teacher age', age)
    name = get_user_input('Enter teacher name', name)
    create_object(Teacher, @people, id, age, name)
  end

  def create_a_person
    puts "Do you want to create a student (1) or a teacher (2)? [Input the number]:\n"
    choice = gets.chomp
    case choice
    when '1'
      create_a_student
    when '2'
      create_a_teacher
    else
      puts 'Invalid option [1 or 2]'
    end
  end

  def list_all_people
    puts 'There are currently no people! press 3 to create a person' if @people.empty?
    @people.map.with_index { |person, index| print "#{index}) Name: #{person.name} - Age: #{person.age}" }
  end

  def is_empty(store)
    if store.empty?
      false
    end
    true
  end

  def create_rental
    if is_empty(@books) && is_empty(@people)
      puts 'There are no books or people'
      puts ''
    end
    book = ''
    person = ''
    date = DateTime.now

    unless !is_empty(@books)
      list_all_books
      book = get_user_input("choose a book from above", book)
    end

    unless !is_empty(@people)
      list_all_people
      person = get_user_input("choose a person from above", person)
    end

    create_object(Rental, @rentals, date, book, person)
  end

  def list_all_rentals(id)
    puts 'There is no id match' unless @rentals.include?(id)
    puts 'Currently no rentals for that id, press 5 to create a rental' if @rentals.empty?
    @people.each do |person|
      @rentals.each do |_rental|
        puts "Renter: #{person.name} - Age: #{person.age}" if person.id == id
      end
    end
  end
end