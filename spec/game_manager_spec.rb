# frozen_string_literal: true

require './lib/game_manager.rb'

RSpec.describe GameManager do
  let(:game_manager) { GameManager.new }
  let(:init_board) { game_manager.init_board(9) }

  describe '#init_board' do
    it 'This initialize board array' do
      expect(init_board).to eq(['-', '-', '-', '-', '-', '-', '-', '-', '-'])
    end
  end

  describe '#set_input' do
    it 'Inputs symbol X into chosen position' do
      board = init_board
      expect(game_manager.set_input(0, 'X')).to eq(board[0] = 'X')
    end
  end

  describe '#set_input' do
    it 'Inputs symbol O into chosen position' do
      board = init_board
      expect(game_manager.set_input(0, 'O')).to eq(board[0] = 'O')
    end
  end

  describe '#space_filled?' do
    it 'Checks if a board position has X or O' do
      board = init_board
      board[1] = 'X'
      expect(game_manager.space_filled?(1)).to eq(true)
    end
  end

  describe '#valid_move?' do
    it 'Checks if option selected is between 1-9, and is not occupied' do
      board = init_board
      board[3] = 'O'
      expect(game_manager.valid_move?(3)).to eq(false)
    end
  end

  describe '#turn_count' do
    it 'Displays counter for how many turns has been passed' do
      board = init_board
      board[0] = 'X'
      board[1] = 'O'
      board[2] = 'X'
      board[3] = 'O'
      board[4] = 'X'
      expect(game_manager.turn_count).to eq(5)
    end
  end

  describe '#current_player' do
    it 'Displays current player symbol based on turn_count, X if even, O if odd' do
      board = init_board
      board[0] = 'X'
      expect(game_manager.current_player).to eq('O')
    end
  end

  describe '#full?' do
    it 'Checks if all the positions in the board are occupied' do
      board = init_board
      board[0] = 'X'
      board[1] = 'O'
      board[2] = 'X'
      board[3] = 'O'
      expect(game_manager.full?).to eq(false)
    end
  end

  describe '#won?' do
    it 'Top horizontal win combination' do
      board = init_board
      board[0] = 'O'
      board[1] = 'O'
      board[2] = 'O'
      expect(game_manager.won?).to eq([0, 1, 2])
    end

    it 'First Diagonal win combination' do
      board = init_board
      board[0] = 'X'
      board[4] = 'X'
      board[8] = 'X'
      expect(game_manager.won?).to eq([0, 4, 8])
    end

    it 'Second Diagonal win combination' do
      board = init_board
      board[2] = 'X'
      board[4] = 'X'
      board[6] = 'X'
      expect(game_manager.won?).to eq([6, 4, 2])
    end

    it 'Middle horizontal win combination' do
      board = init_board
      board[3] = 'O'
      board[4] = 'O'
      board[5] = 'O'
      expect(game_manager.won?).to eq([3, 4, 5])
    end

    it 'Bottom horizontal win combination' do
      board = init_board
      board[6] = 'X'
      board[7] = 'X'
      board[8] = 'X'
      expect(game_manager.won?).to eq([6, 7, 8])
    end

    it 'Left vertical win combination' do
      board = init_board
      board[0] = 'O'
      board[3] = 'O'
      board[6] = 'O'
      expect(game_manager.won?).to eq([0, 3, 6])
    end

    it 'Middle vertical win combination' do
      board = init_board
      board[1] = 'O'
      board[4] = 'O'
      board[7] = 'O'
      expect(game_manager.won?).to eq([1, 4, 7])
    end

    it 'Right vertical win combination' do
      board = init_board
      board[2] = 'O'
      board[5] = 'O'
      board[8] = 'O'
      expect(game_manager.won?).to eq([2, 5, 8])
    end
  end

  describe '#draw?' do
    it 'Checks if there is a draw after all positions are occupied and no win' do
      board = init_board
      board[0] = 'X'
      board[1] = 'O'
      board[2] = 'X'
      board[3] = 'X'
      board[4] = 'X'
      board[5] = 'O'
      board[6] = 'O'
      board[7] = 'X'
      board[8] = 'O'
      expect(game_manager.draw?).to eq(true)
    end
  end

  describe '#over?' do
    it 'Checks for won? or full? or draw?, returns true if game is over' do
      board = init_board
      board[0] = 'X'
      board[1] = 'O'
      board[2] = 'X'
      board[3] = 'X'
      board[4] = 'X'
      board[5] = 'O'
      board[6] = 'O'
      board[7] = 'X'
      board[8] = 'O'
      expect(game_manager.over?).to eq(true)
    end

    it 'Checks for won? or full? or draw?, returns true if game is over' do
      board = init_board
      board[0] = 'X'
      board[1] = 'X'
      board[2] = 'X'
      board[3] = 'X'
      board[4] = 'X'
      board[5] = 'O'
      board[6] = 'O'
      board[7] = 'X'
      board[8] = 'O'
      expect(game_manager.over?).to eq(game_manager.won?)
    end
  end
end
