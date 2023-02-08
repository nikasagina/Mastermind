require_relative 'game.rb'

def start_text
  puts 'Hi, Welcome to Mastermind'
  puts 'Please enter your choice'
  puts '1. Code Maker: - you make a code and computer guesses it'
  puts '2. Code Breaker: - computer randomly selects a code and you try to break it.\n'
  puts
  puts 'Clues:'
  puts '🟠: - Right Number Wrong Position'
  puts '🟢: - Right Number Right Position'
  puts 
  puts 'Enter your choice: '
end

def read_input
  input = gets.chomp!
  until input == '1' || input == '2'
    puts 'Invalid input, enter 1 for code maker, 2 for code breaker: '
    input = gets.chomp!
  end
  input
end

start_text
game = Mastermind.new(read_input)
