#!/usr/bin/env ruby

class Input 
  def self.prompt
    print "> "
    input = gets
    return input.nil? ? "" : input.strip
  end
end

if __FILE__ == $0
  puts "Welcome to Ruby Shell Games! What would you like to play?"
  puts "1. tic-tac-toe\n2. wordle\n3. ruby quiz"
  puts "(Type the number or name of the game you would like to start.)"

  loop do
    case Input::prompt
      when "1", "tic-tac-toe"
        puts "Starting tic-tac-toe...\n\n"
        exec "ruby tic_tac_toe.rb"
      when "2", "wordle"
        puts "Starting wordle...\n\n"
        exec "ruby wordle.rb"
      when "3", "ruby quiz"
        puts "Starting quiz...\n\n"
        exec "ruby quiz.rb"
      when "", nil
        break
      else
        puts "ERROR: Unrecognized command. Please try again."
    end
  end

end
