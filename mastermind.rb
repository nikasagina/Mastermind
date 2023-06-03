# frozen_string_literal: true

require_relative 'code_evaluator'
require_relative 'code_validator'
require_relative 'code_generator'
require_relative 'human_player'
require_relative 'computer_player'
require_relative 'code_reader'

# Mastermind object
class Mastermind
  def initialize(mode)
    @code_generator = CodeGenerator.new
    @code_validator = CodeValidator.new
    @code_evaluator = CodeEvaluator.new
    @code_reader = CodeReader.new
    @human_player = HumanPlayer.new(@code_validator)
    @computer_player = ComputerPlayer.new(@code_evaluator, @code_generator)
    @the_code = mode == 1 ? @code_reader.read : @code_generator.generate_code
    mode == 1 ? computer_mode : human_mode
  end

  def human_mode
    guesses_left = 12
    is_ended = false
    res = ''
    puts 'Enter 4 digit code. Each digit from 1-6'
    until is_ended
      puts "Guesses left: #{guesses_left}"
      res = @code_evaluator.evaluate_guess(@the_code, @human_player.make_guess)
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
    current_guess = '1122' # initial guess

    until is_ended
      puts "Guesses left: #{guesses_left}"
      res = @code_evaluator.evaluate_guess(@the_code, current_guess)
      puts "computer guesses: #{current_guess} -> #{res}"
      current_guess = @computer_player.make_guess(current_guess, res)
      guesses_left -= 1
      is_ended = res == '🟢🟢🟢🟢' || guesses_left.zero?
      sleep(1) # Slow down the computer's guesses
    end
    puts res == '🟢🟢🟢🟢' ? 'Computer wins' : 'Computer lost'
  end
end
