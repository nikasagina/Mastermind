require_relative 'game.rb'

def start_text
  puts 'Hi, Welcome to Mastermind'
  puts 'Please enter your choice'
  puts '1. Code Maker: - you make a code and computer guesses it'
  puts '2. Code Breaker: - computer randomly selects a code and you try to break it.'
  puts
  puts 'Clues:'
  puts '🟠: - Right Number Wrong Position'
  puts '🟢: - Right Number Right Position'
  puts 
  puts 'Enter your choice: '
end

def read_input
  input = gets.chomp
  until input == '1' || input == '2'
    puts 'Invalid input, enter 1 for code maker, 2 for code breaker: '
    input = gets.chomp
  end
  input
end


def play
  start_text
  mode = read_input.to_i
  game = Mastermind.new(mode)
  mode == 1 ? game.computer_mode : game.human_mode
  puts 'play again? (y/n)'
  input = gets.chomp.downcase
  self.play if input == 'y'
end

play
