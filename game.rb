# frozen_string_literal: true
require 'fiddle'
# Mastermind object
class Mastermind
  def initialize(mode)
    @the_code = mode == 1 ? read_code : generate_code
  end

  def human_mode
    guesses_left = 12
    is_ended = false
    res = ''
    puts 'Enter 4 digit code. Each digit from 1-6'
    until is_ended
      puts "Guesses left: #{guesses_left}"
      res = evaluate_guess(@the_code, read_code)
      puts res
      guesses_left -= 1
      is_ended = res == '🟢🟢🟢🟢' || guesses_left.zero?
    end
    puts res == '🟢🟢🟢🟢' ? 'YOU WIN!!!!' : "You lose :(\nThe code was #{@the_code}"
  end

  def computer_mode
    guesses_left = 12
    is_ended = false
    res = ''
    @all_possible = generate_all_codes
    current_guess = '1122' # initial guess

    until is_ended
      puts "Guesses left: #{guesses_left}"
      res = evaluate_guess(@the_code, current_guess)
      puts "computer guesses: #{current_guess} -> #{res}"
      delete_impossibles(current_guess, res)
      guesses_left -= 1
      is_ended = res == '🟢🟢🟢🟢' || guesses_left.zero?
      current_guess = @all_possible[0]
    end
    puts res == '🟢🟢🟢🟢' ? 'Computer wins' : 'Computer lost'
  end

  private

  def evaluate_guess(correct, guess)
    guess = guess.to_s

    return_vars = count_exact_matches(correct, guess)
    count_wrong_position(return_vars)

    return_vars[0]
  end

  def count_exact_matches(correct, guess)
    return_vars = ['', '', '']
    guess.each_char.with_index do |color, i|
      if correct[i] == color
        return_vars[0] += '🟢'
      else
        return_vars[1] += correct[i].to_s
        return_vars[2] += color.to_s
      end
    end

    return_vars
  end

  def count_wrong_position(values)

    leftover_code = values[1]
    leftover_guess = values[2]

    leftover_guess.each_char do |color|
      if leftover_code.include?(color)
        values[0] += '🟠'
        leftover_guess.delete!(color)
      end
    end
  end

  def delete_impossibles(guess, res)
    new_array = []
    @all_possible.each do |elem|
      if possible?(elem, guess, res)
        new_array.append(elem)
      end
    end
    @all_possible = new_array
  end

  def possible?(elem, guess, res)

  end

  def generate_all_codes
    res = []

    6.times do |i|
      6.times do |j|
        6.times do |k|
          6.times do |m|
            res.append((i + 1).to_s + (j + 1).to_s + (k + 1).to_s + (m + 1).to_s)
          end
        end
      end
    end

    res
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
end
