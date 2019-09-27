#!/usr/bin/env ruby

# frozen_string_literal: true



require_relative '../lib/game_manager.rb'



class Main

  def initialize

    @game = GameManager.new

    @board = @game.init_board(9)
    @player1 = nil
    @player2 = nil

  end


  def welcome
    puts "\nWelcome to Tic Tac Toe\n\n"

    print 'Player 1 please enter your name: '
    @player1 = gets.chomp

    print "\nPlayer 2 please enter your name: "
    @player2 = gets.chomp

    puts "\nPlayer 1: #{@player1}, Token: X"
    puts "Player 2: #{@player2}, Token: O\n"

    display
  end

  def ending
    puts "\n\nThank you for playing Tic Tac Toe."
  end


  def display

    puts "\n #{@board[0]} | #{@board[1]} | #{@board[2]} "

    puts ' ---------- '

    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "

    puts ' ---------- '

    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end


  def turn
    current = @game.current_player
    print "\nPlayer #{current}, choose a spot between 1-9: "
    spot = gets.strip
    spot = @game.board_index(spot)
    if @game.valid_move?(spot)
      @game.set_input(spot, @game.current_player)
    else
      print "\nPlease enter a valid option between 1-9: \n"
      display
      turn
    end
    display
  end

  def play
    turn until @game.over?
    if @game.won?
      puts "\nCongratulations #{@board[@game.won?.first]}!"
    elsif @game.draw?
      puts "\nIt's a draw!"
    end
  end
end



main = Main.new

main.welcome
main.play

main.ending
