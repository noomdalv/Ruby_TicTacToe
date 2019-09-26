# frozen_string_literal: true

class GameManager
  def initialize
    @board = nil
  end

  def init_board(grid)
    @board = Array.new(grid) { '-' }
  end

  def set_input(index, input = 'X')
    @board[index] = input
  end

  def space_filled?(index)
    @board[index] == 'X' || @board[index] == 'O'
  end

  def board_index(input_index)
    input_index.to_i - 1
  end

  def valid_move?(arr_pos)
    arr_pos.between?(0, 8) && !space_filled?(arr_pos)
  end

  def turn_count
    @board.select { |e| e == 'X' || e == 'O' }.size
  end

  def current_player
    player = if (turn_count % 2).zero?
               'X'
             else
               'O'
             end
    player
  end

  def full?
    turn_count == 9
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end
end
