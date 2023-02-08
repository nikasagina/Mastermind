# frozen_string_literal: true

# Mastermind object
class Mastermind
  def initialize(input)
    @board = input == '1' ? read_code : generate_code
  end

  def player_guess(guess)
    guess = guess.to_s
    arr = Array.new(7)
    res = exact_matches(guess, arr)
    res += wrong_position(guess, arr)
    res
  end

  private

  def read_code
    puts 'Enter 4 digit code. Each digit from 1-6'
    code = gets.chomp!
    until valid_code?(code)
      puts 'Invalid code. Try again'
      code = gets.chomp!
    end
    code
  end

  def generate_code
    res = ''
    4.times do
      res += rand(1..6).to_s
    end
    res
  end

  def valid_code?(code)
    return false if code.length != 4

    code.each_char { |num| return false if num.to_i > 6 || num.to_i < 1 }
    true
  end

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