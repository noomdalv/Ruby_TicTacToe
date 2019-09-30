# frozen_string_literal: true

require './lib/game_manager.rb'

RSpec.describe GameManager do
  let(:game_manager) { GameManager.new }
  let(:init_board) { game_manager.init_board(9) }
  describe '#init_board' do
    it 'This initilaze board array' do
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
			board[0] = "X"
      expect(game_manager.current_player).to eq("O")
    end
  end

	describe '#full?' do
    it 'Checks if all the positions in the board are occupied' do
			board = init_board
			board[0], board[1], board[2], board[3] = "X", "O", "X", "O"
      expect(game_manager.full?).to eq(false)
    end
  end




end
