# frozen_string_literal: true

# CodeGenerator object
class CodeGenerator
  def generate_code
    res = ''
    4.times do
      res += rand(1..6).to_s
    end
    res
  end
end
