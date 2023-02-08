# frozen_string_literal: true

# Mastermind object
class Mastermind
  def initialize(input)
    @the_code = input == 1 ? read_code : generate_code
  end

  def human_action
    guesses_left = 12
    is_ended = false
    until is_ended || guesses_left.zero?
      res = player_guess(read_code)
      puts res
      is_ended = true if res == '🟢🟢🟢🟢'
      guesses_left -= 1
      puts "Guesses left: #{guesses_left}"
    end
    puts is_ended ? 'YOU WIN!!!!' : "you lose :( \n the code was #{@the_code}"
  end

  private

  def player_guess(guess)
    guess = guess.to_s
    arr = Array.new(7)
    res = exact_matches(guess, arr)
    res += wrong_position(guess, arr)
    res
  end

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
      if @the_code[i] == color
        res += '🟢'
        arr[color.to_i] = 1
      end
    end
    res
  end

  def wrong_position(guess, arr)
    res = ''
    guess.each_char do |color|
      if @the_code.include?(color) && arr[color.to_i] != 1
        res += '🟠'
        arr[color.to_i] = 1
      end
    end
    res
  end
end
