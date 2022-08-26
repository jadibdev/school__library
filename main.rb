#!/usr/bin/env ruby
require './app'
require './student'
require './teacher'

app = App.new
puts 'Please choose an option by entering a number:'
puts '1 - List all books'
puts '2 - List all people'
puts '3 - Create a person'
puts '4 - Create a book'
puts '5 - Create a rental'
puts '6 - List all rentals for a given person id'
puts '7 - Exit'

option = gets.chomp

while option
  if option.to_i == 4
    app.create_a_book

    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp
  end

  if option.to_i == 1
    app.list_all_books
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp
  end

  if option.to_i == 2
    app.list_all_people
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp
  end

  if option.to_i == 3
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    choice = gets.chomp
    app.create_a_person(choice)
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp
  end

  if option.to_i == 5
    app.create_rental

    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp
  end

  if option.to_i == 6
    puts 'Enter a person id'
    id = gets.chomp
    app.list_all_rentals(id)
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    option = gets.chomp
  end

  exit if option.to_i == 7
end
