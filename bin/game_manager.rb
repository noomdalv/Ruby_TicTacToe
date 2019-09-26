# frozen_string_literal: true

class GameManager
  def initialize(name)
    puts "GameManager class #{name}"
  end

  def set_input(index, input = 'X')
    puts "#{index} #{input}"
  end
end
