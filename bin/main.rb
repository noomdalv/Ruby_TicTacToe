#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/game_manager.rb'
require_relative '../lib/player.rb'

class Main
  def initialize
    @game = GameManager.new

    @board = @game.init_board(9)
    @player1 = Player.new
    @player2 = Player.new
  end

  def welcome
    puts "\nWelcome to Tic Tac Toe\n\n"

    print 'Player 1 please enter your name: '
    @player1.name = gets.chomp
    @player1.symbol = 'X'

    print "\nPlayer 2 please enter your name: "
    @player2.name = gets.chomp
    @player2.symbol = 'O'

    puts "\nPlayer 1: #{@player1.name}, Symbol: #{@player1.symbol}"
    puts "Player 2: #{@player2.name}, Symbol: #{@player2.symbol}\n"

    display
  end

  def ending
    puts "\n\nThank you for playing Tic Tac Toe."
  end

  def display
    puts "\n       #{@board[0]} | #{@board[1]} | #{@board[2]} "

    puts '       ---------- '

    puts "       #{@board[3]} | #{@board[4]} | #{@board[5]} "

    puts '       ---------- '

    puts "       #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def choose_position
    current = @game.current_player
    if current == 'X'
      print "\n #{@player1.name}, choose a position between 1-9: "
    else
      print "\n #{@player2.name}, choose a position between 1-9: "
    end
  end

  def turn
    choose_position
    spot = gets.strip
    spot = @game.board_index(spot)
    if @game.valid_move?(spot)
      @game.set_input(spot, @game.current_player)
      display
    else
      print "\nPlease enter a valid option between 1-9: \n"
      turn
    end
  end

  def play
    turn until @game.over?
    if @game.won?
      if @board[@game.won?.first] == 'X'
        puts "\nCONGRATULATIONS #{@player1.name}!"
      else
        puts "\nCONGRATULATIONS #{@player2.name}!"
      end
    elsif @game.draw?
      puts "\nIt's a draw!"
    end
  end
end

main = Main.new

main.welcome
main.play

main.ending