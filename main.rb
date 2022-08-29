#!/usr/bin/env ruby
require './app'
require './student'
require './teacher'
require './menu'

app = App.new
menu
option = gets.chomp

while option
  if option.to_i == 1
    app.list_all_books
    puts ''
    menu
    option = gets.chomp
  end

  if option.to_i == 2
    app.list_all_people
    puts ''
    menu
    option = gets.chomp
  end

  if option.to_i == 3
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    choice = gets.chomp
    choice == '1' ? app.create_a_student : app.create_a_teacher
    puts ''
    menu
    option = gets.chomp
  end

  if option.to_i == 4
    app.create_a_book
    menu
    option = gets.chomp
  end

  if option.to_i == 5
    app.create_rental
    menu
    option = gets.chomp
  end

  if option.to_i == 6
    puts 'Enter a person id'
    id = gets.chomp
    app.list_all_rentals(id)
    puts ''
    menu
    option = gets.chomp
  end

  exit if option.to_i == 7
end
