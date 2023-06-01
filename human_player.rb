# frozen_string_literal: true

# human_player.rb object
class HumanPlayer
  def initialize(code_validator)
    @code_validator = code_validator
  end

  def make_guess
    code = read_code
    until @code_validator.valid_code?(code)
      puts 'Invalid code. Try again'
      code = read_code
    end
    code
  end

  private

  def read_code
    gets.chomp
  end
end
