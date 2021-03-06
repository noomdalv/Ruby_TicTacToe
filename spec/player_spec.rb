# frozen_string_literal: true

require './lib/player.rb'

RSpec.describe Player do
  let(:player1) { Player.new('Joe', 'X') }
  let(:player2) { Player.new('Bob', 'O') }

  describe '#initialize' do
    it 'assigns name to new player 1' do
      expect(player1.name).to eql('Joe')
    end

    it 'assigns symbol to new player 1' do
      expect(player1.symbol).to eql('X')
    end

    it 'assigns name to new player 2' do
      expect(player2.name).to eql('Bob')
    end

    it 'assigns symbol to new player 2' do
      expect(player2.symbol).to eql('O')
    end
  end
end
