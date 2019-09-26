#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/game_manager.rb'

class Main
  def initialize
    @game = GameManager.new
    @board = @game.init_board(9)
  end

  def welcome
    # Welcome Message
    puts 'Welcome to Tic Tac Toe'

    # Request for player names and save them to p1 and p2
    puts 'Player 1 please enter your name: '
    p1 = gets.chomp

    puts 'Player 2 please enter your name: '
    p2 = gets.chomp

    puts "Player 1: #{p1}, Token: X"
    puts "Player 2: #{p2}, Token: O"

    display
  end

  def ending
    puts 'Thank you for playing Tic Tac Toe.'
  end

  def display
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ---------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ---------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Game begins, player 1 starts choosing between 1-9
  # if the input is different valid_move returns false and input is request again
  def turn
    current = @game.current_player
    puts "Player #{current}, choose a spot between 1-9"
    spot = gets.strip
    spot = @game.board_index(spot)
    if @game.valid_move?(spot)
      @game.set_input(spot, @game.current_player)
    else
      puts 'Please enter a valid option between 1-9'
      display
      turn
    end
    display
  end

  # Turn method is called for players to fill the board until @game.over? method is true
  # If total moves = 9 and no combinations detected, its a draw, if a combination is detected, @game.won is executed
  def play
    turn until @game.over?
    if @game.won?
      puts "Congratulations #{@board[@game.won?.first]}!"
    elsif @game.draw?
      puts "It's a draw!"
    end
  end
end

main = Main.new
main.welcome
main.play
main.ending
