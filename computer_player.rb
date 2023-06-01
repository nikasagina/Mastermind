# frozen_string_literal: true

# ComputerPlayer object
class ComputerPlayer
  def initialize(code_evaluator, code_generator)
    @code_evaluator = code_evaluator
    @code_generator = code_generator
  end

  def make_guess(previous_guess, previous_result)
    delete_impossibles(previous_guess, previous_result)
    @all_possible[0]
  end

  private

  def delete_impossibles(guess, res)
    new_array = []
    @all_possible.each do |elem|
      new_array << elem if possible?(elem, guess, res)
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
end
