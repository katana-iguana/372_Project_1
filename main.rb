#!/usr/bin/env ruby

class Input 
  def self.prompt
    print "> "
    return gets.strip
  end
end

if __FILE__ == $0
  puts "Welcome to Ruby Shell Games! What would you like to play?"
  puts "1. tic-tac-toe\n2. wordle\n3. TBD"
  puts "(Type the number or name of the game you would like to start.)"

  loop do
    case Input::prompt
      when "1", "tic-tac-toe"
        puts "Starting tic-tac-toe...\n\n"
        exec "ruby tic_tac_toe.rb"
      when "2", "wordle"
        puts "Starting wordle...\n\n"
        exec "ruby wordle.rb"
      when "3", "TBD"
        puts "Starting TBD..."
        break
      else
        puts "ERROR: Unrecognized command. Please try again."
    end
  end

end
