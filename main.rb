# frozen_string_literal: true

require_relative 'mastermind'

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
  until %w[1 2].include?(input)
    puts 'Invalid input, enter 1 for code maker, 2 for code breaker: '
    input = gets.chomp
  end
  input
end

def play
  start_text
  mode = read_input.to_i
  Mastermind.new(mode)
  puts 'play again? (y/n)'
  input = gets.chomp.downcase
  play if input == 'y'
end

play
