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
    @books.each { |book| puts "Title: #{book.title} - Author: #{book.author}" }
  end

  def create_a_person
    puts 'Create a person'
    puts 'Enter name: '
    name = gets.chomp
    puts 'Enter age'
    age = gets.chomp
    puts 'Enter id'
    id = gets.chomp
    person = Person.new(age, name, id)
    @people.push(person)
  end

  def list_all_people
    puts 'There are currently no people! press 3 to create a person' if @people.empty?
    @people.each { |person| print "Name: #{person.name} - Age: #{person.age}" }
  end

  def create_rental
    puts 'Create rental'
    date = DateTime.now
    puts 'Enter book: '
    book = gets.chomp
    puts 'Enter person id'
    person = gets.chomp
    rental = Rental.new(date, book, person)
    @rentals.push(rental)
  end

  def list_all_rentals(id)
    puts 'There is no id match' unless @rentals.include?(id)
    puts 'Currently no rentals for that id, press 5 to create a rental' if @rentals.empty?
    # map over people if a person has id, return that person's rentals

    @rentals.each do |rental|
      puts "Book: #{rental.book} - Id: #{rental.person}" if rental.person == id
    end
  end
end
