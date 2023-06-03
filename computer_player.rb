# frozen_string_literal: true

# ComputerPlayer object
class ComputerPlayer
  def initialize(code_evaluator, code_generator)
    @code_evaluator = code_evaluator
    @code_generator = code_generator
    @all_possible = generate_all_codes
  end

  def make_guess(previous_guess, previous_result)
    delete_impossibles(previous_guess, previous_result)

    min_score = Float::INFINITY
    next_guess = ''

    @all_possible.each do |code|
      score = calculate_score(code)
      if score < min_score
        min_score = score
        next_guess = code
      end
    end

    next_guess
  end

  private

  def delete_impossibles(guess, res)
    @all_possible.delete_if { |elem| @code_evaluator.evaluate_guess(elem, guess) != res }
  end

  def calculate_score(code)
    scores = Hash.new(0)

    @all_possible.each do |possible_code|
      score = @code_evaluator.evaluate_guess(code, possible_code)
      scores[score] += 1
    end

    scores.values.max
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
