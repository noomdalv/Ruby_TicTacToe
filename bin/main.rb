#!/usr/bin/env ruby
# frozen_string_literal: true

# main class.
class Main
	welcome = p "Welcome to Ruby Tic Tac Toe"

	p "Player 1 please enter your name: "
	p1name = gets.chomp
	p "Hello #{p1name}, you will play with X"

	p "Player 2 please enter your name: "
	p2name = gets.chomp
	p "Hello #{p2name}, you will play with O"
end

# Game Board
class Board
  def initialize
    @board = Array.new(9) { '?' }
  end

  def display
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ---------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ---------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end

grid = Board.new
grid.display
