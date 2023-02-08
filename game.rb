# frozen_string_literal: true

# Mastermind object
class Mastermind
  def initialize
    @board = '1234'
  end

  def player_guess(guess)
    guess = guess.to_s
    arr = Array.new(7)
    res = exact_matches(guess, arr)
    res += wrong_position(guess, arr)
    res
  end

  private

  def exact_matches(guess, arr)
    res = ''
    guess.each_char.with_index do |color, i|
      if @board[i] == color
        res += '🟢'
        arr[color.to_i] = 1
      end
    end
    res
  end

  def wrong_position(guess, arr)
    res = ''
    guess.each_char do |color|
      if @board.include?(color) && arr[color.to_i] != 1
        res += '🟠'
        arr[color.to_i] = 1
      end
    end
    res
  end
end

game = Mastermind.new
p game.player_guess(4344)
