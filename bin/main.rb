#!/usr/bin/env ruby
# frozen_string_literal: true
# Game Board
class Board
  def initialize
    @board = Array.new(9) { '-' }
  end

  def display
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ---------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ---------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def insertMove(position, token = "X")
	  @board[position] = token
  end
end

# main class.
class Main
	welcome = p "Welcome to Ruby Tic Tac Toe"

	p "Player 1 please enter your name: "
	p1name = gets.chomp
	p "Hello #{p1name}, you will play with X"

	p "Player 2 please enter your name: "
	p2name = gets.chomp
	p "Hello #{p2name}, you will play with O"

	grid = Board.new
	grid.display

	p "Player 1 Turn, please select your next move: "
	p1turn = gets.chomp.to_i
	grid.insertMove(p1turn)

	grid.display

	p "Player 2 Turn, please select your next move: "
	p2turn = gets.chomp.to_i
	grid.insertMove(p2turn, "O")

	grid.display

ending = p "Thank you for playing Tic Tac Toe"
ending
end
