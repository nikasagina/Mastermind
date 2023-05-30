# frozen_string_literal: true

# Mastermind object
class Mastermind
  def initialize(mode)
    @the_code = mode == 1 ? read_code : generate_code
  end

  def human_mode
    guesses_left = 12
    is_ended = false
    res = ""
    puts 'Enter 4 digit code. Each digit from 1-6'
    until is_ended
      puts "Guesses left: #{guesses_left}"
      res = evaluate_guess(read_code)
      puts res
      guesses_left -= 1
      is_ended = res == '🟢🟢🟢🟢' || guesses_left.zero?
    end
    puts res == '🟢🟢🟢🟢' ? 'YOU WIN!!!!' : "You lose :(\nThe code was #{@the_code}"
  end

  def computer_mode
    guesses_left = 12
    is_ended = false
    res = ""
    until is_ended
      puts "Guesses left: #{guesses_left}"
      guess = computer_guess
      res = evaluate_guess(guess)
      puts "computer guesses: #{guess} -> #{res}"
      guesses_left -= 1
      is_ended = res == '🟢🟢🟢🟢' || guesses_left.zero?
    end
    puts res == '🟢🟢🟢🟢' ? 'Computer wins' : 'Computer lost'
  end

  private

  def evaluate_guess(guess)
    guess = guess.to_s
    leftover_code = ''
    leftover_guess = ''
    exact_matches(guess, leftover_code, leftover_guess) +  wrong_position(leftover_code, leftover_guess)
  end

  def computer_guess
 
  end

  def read_code
    code = gets.chomp
    until valid_code?(code)
      puts 'Invalid code. Try again'
      code = gets.chomp
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

  def exact_matches(guess, leftover_code, leftover_guess)
    res = ''
    guess.each_char.with_index do |color, i|
      if @the_code[i] == color
        res += '🟢'
      else
        leftover_code += @the_code[i]
        leftover_guess += color
      end
    end
    res
  end

  def wrong_position(leftover_code, leftover_guess)
    res = ''
    leftover_guess.each_char do |color|
      if leftover_code.include?(color)
        res += '🟠'
        leftover_guess.delete!(color)
      end
    end
    res
  end
end
