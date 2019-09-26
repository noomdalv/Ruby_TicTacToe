#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../lib/game_manager.rb'

class Main

	def initialize
     @game = GameManager.new
     @board = @game.init_board(9)
  end

   def display
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts ' ---------- '
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts ' ---------- '
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

  end

  main = Main.new
  main.play
