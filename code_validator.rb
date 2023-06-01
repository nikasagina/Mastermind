# frozen_string_literal: true

# CodeValidator object
class CodeValidator
  def valid_code?(code)
    return false if code.length != 4

    code.each_char { |num| return false if num.to_i > 6 || num.to_i < 1 }
    true
  end
end
