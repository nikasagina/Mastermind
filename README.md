# Mastermind Game

### Introduction

In this project, I have implemented a Ruby version of the popular board game, Mastermind. The game can be played in two modes, i.e., Code Maker and Code Breaker. In Code Maker mode, the player has to create a secret code, and the computer will try to guess it. In Code Breaker mode, the computer randomly generates a secret code, and the player has to guess it.

### Features

- Two game modes: Code Maker and Code Breaker
- In Code Maker mode, the computer uses Knuth's algorithm to guess the code
- In Code Breaker mode, the computer generates a random code
- The game provides feedback on each guess using colored pins. Red pins represent a correct guess in the correct position, while orange pins represent a correct guess in the wrong position.
- The game ends when the code is correctly guessed or after 12 unsuccessful attempts.

### Screenshots

![Screenshot of Mastermind game](/screenshots/codemaker.PNG "Mastermind game screenshot")

### How to Play

1. Clone the repository to your local machine
2. Navigate to the project directory
3. `ruby main.rb`
4. Follow the instructions

### Dependencies

- Ruby 2.7.2 or higher

### Credits

This project is part of The Odin Project curriculum. The original project specifications can be found [here](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-programming/lessons/mastermind).
