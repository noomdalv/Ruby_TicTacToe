# frozen_string_literal: true

class GameManager
  def initialize
    @board = nil
    puts 'GameManager class'
  end

  def init_board(grid)
    @board = Array.new(grid) { '-' }
  end

  def set_input(index, input = 'X')
    @board[index] = input
  end
end
