#!/usr/bin/env ruby
# frozen_string_literal: true

# main class.
class Main
  welcome = 'Welcome to Tic Tac Toe'
  p welcome

  puts 'Player 1 please enter your name: '
  p1 = gets.chomp
  greeting(p1)

  puts 'Player 2 please enter your name: '
  p2 = gets.chomp
  greeting(p2)

  def greeting(name)
    puts "Hello #{name}"
  end
end
