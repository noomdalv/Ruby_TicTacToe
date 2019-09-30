# frozen_string_literal: true

require './lib/game_manager.rb'

RSpec.describe GameManager do
  let(:game_manager) {GameManager.new}
  let(:init_board) {game_manager.init_board(9)}
  describe '#init_board' do
    it 'This initilaze board array' do
      expect(init_board).to eq(["-", "-", "-", "-", "-", "-", "-", "-", "-"])
    end
  end

  describe '#set_input' do
    it 'This initilaze board array' do
      expect(game_manager.set_input(0, 'X')).to eq(["X"])
    end
  end
end
