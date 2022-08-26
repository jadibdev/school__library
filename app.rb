require './book'
require './person'
require 'date'

class App
  def ()
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

  # def create_a_person(type)
  #   if type == '1'
  #     puts 'Enter student id'
  #     id = gets.chomp
  #     puts 'Enter student age: '
  #     age = gets.chomp
  #     puts 'Enter student name'
  #     name = gets.chomp
  #     puts 'Enter parent permission: true or false'
  #     parent_permission = gets.chomp
  #     student = Student.new(id, age, name, parent_permission)
  #     @people.push(student)
  #   end
  #   if type == '2'
  #     puts 'Enter teacher id'
  #     id = gets.chomp
  #     puts 'Enter teacher age: '
  #     age = gets.chomp
  #     puts 'Enter teacher name'
  #     name = gets.chomp
  #     teacher = Teacher.new(id, age, name)
  #     @people.push(teacher)
  #   end
  # end

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
