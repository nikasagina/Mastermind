# frozen_string_literal: true

# CodeEvaluator object
class CodeEvaluator
  def evaluate_guess(correct, guess)
    guess = guess.to_s

    return_vars = count_exact_matches(correct, guess)
    count_wrong_position(return_vars)

    return_vars[0]
  end

  private

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
end
