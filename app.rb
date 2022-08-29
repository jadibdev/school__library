require './book'
require './person'
require 'date'

class App
  def initialize()
    @books = []
    @people = []
    @rentals = []
  end

  def create_a_book
    puts 'Create a new book'
    puts 'Enter a new title'
    title = gets.chomp
    puts 'Enter an author'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
  end

  def list_all_books
    puts 'There are currently no books! press 4 to create a book' if @books.empty?
    @books.map.with_index { |book, index| puts "#{index}) Title: #{book.title} - Author: #{book.author}" }
  end

  def create_a_student
    puts 'Enter student id'
    id = gets.chomp
    puts 'Enter student age: '
    age = gets.chomp
    puts 'Enter student name'
    name = gets.chomp
    puts 'Enter parent permission: true or false'
    parent_permission = gets.chomp
    student = Student.new(id, age, name, parent_permission)
    @people.push(student)
  end

  def create_a_teacher
    puts 'Enter teacher id'
    id = gets.chomp
    puts 'Enter teacher age: '
    age = gets.chomp
    puts 'Enter teacher name'
    name = gets.chomp
    teacher = Teacher.new(id, age, name)
    @people.push(teacher)
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

  def create_rental
    if @books.empty? && @people.empty?
      puts 'There are no books or people'
      puts ''
    end
    book = ''
    person = ''
    date = DateTime.now
    unless @books.empty?
      list_all_books
      puts 'choose a book from above'
      book = gets.chomp
    end
    unless @people.empty?
      list_all_people
      puts 'choose a person from above'
      person = gets.chomp
    end
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
  end

  # def list_all_rentals
  #   puts "\n"
  #   if @rentals.empty?
  #     puts 'No rent is registered in the library'
  #   else
  #     puts 'Select a person form the following list by ID'
  #     @people.each do |person|
  #       puts "ID : #{person.id} => #{person.name}"
  #     end
  #     puts "\n"
  #     print "Enter person\'s ID :"
  #     person = gets.chomp
  #     puts "\n"
  #     @rentals.each do |rental|
  #       if rental.person.id.to_i == person.to_i
  #         puts "Book \"#{rental.book.title}\" by : #{rental.book.author}"
  #       end
  #     end
  #   end
  # end

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
