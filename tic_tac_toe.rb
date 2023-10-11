=begin
    tic_tac_toe.rb
    Author: Brooke Adkins
=end

require 'set'

class TicTacToe

    # initialize the board 
    def initialize
        @taken_positions = Set.new
        @game_board = make_board
        @game_board_pos = make_game_board_pos
    end

    # play the game
    def play
        puts "These are the rows and cols for the game board"
        puts "Please type in the row,col to place an 'X'\n\n"

        # print out the board with coordinates
        print_board_coord

        while true
            # print out the board
            print_board

            # get the coordinates from the user
            formatted_answer = get_coord

            # check if game over after user input
            if is_game_over("X")
                print_board
                puts "You won!\n"
                break
            end

            # computer's turn
            play_computer

            # check if game over
            if is_game_over("O")
                print_board
                puts "Nice try :/\n"
                break
            end

            # check if the board is filled
            if @taken_positions.size == 9
                puts "Game over\n"
                break
            end
        end
    end

    # check if there is a winner
    def is_game_over(var)
        # check rows
        @game_board.each do |row|
            if row[0] == var && row[1] == var && row[2] == var  
                return true
            end 
        end

        # check cols
        (0..2).each do |col|
            if @game_board[0][col] == var && @game_board[1][col] == var && @game_board[2][col] == var
                return true
            end
        end

        # check diagonals 
        if @game_board[0][0] == var && @game_board[1][1] == var && @game_board[2][2] == var  
            return true
        end

        if @game_board[0][2] == var && @game_board[1][1] == var && @game_board[2][0] == var
            return true
        end

        return false
    end

    # play computer's move
    def play_computer
        while true
            # get random coordinates from the computer
            rand_row = rand(3)
            rand_col = rand(3)

            # format the coordinates into a string
            formatted_answer = "(#{rand_row},#{rand_col})"

            # validate the computer's input
            if @game_board_pos.flatten.include?(formatted_answer)
                taken = false
                @taken_positions.each do |pos|
                    if pos == formatted_answer
                        taken = true
                    end
                end

                if taken == false
                    @game_board[rand_row][rand_col] = "O"
                    @taken_positions.add(formatted_answer)
                    break
                end
            end
        end

        return formatted_answer
    end

    # prints out the coordinates on the board
    def print_board_coord
        @game_board_pos.each do |row|
            print "           "
            row.each do |col|
                print " #{col} "
            end
            print "\n"
        end
        print "\n\n"
    end

    # get the coordinates from the user
    def get_coord
        while true
            # get the user input
            input = gets
            if input.nil?
                return
            end
            
            # format the user's input
            answer = input.strip
            formatted_answer = "(#{answer})"

            # validate the user's input
            if @game_board_pos.flatten.include?(formatted_answer)
                taken = false
                @taken_positions.each do |pos|
                    if pos == formatted_answer
                        taken = true
                    end
                end

                if taken == false
                    form_answer_array = answer.split(',')
                    row = form_answer_array[0].to_i
                    col = form_answer_array[1].to_i
                    @game_board[row][col] = "X"
                    @taken_positions.add(formatted_answer)
                    break
                end
            end

            puts "No, '#{formatted_answer}' is not in the game board positions."
            puts "Please type in a new coordinate"
        end
    end

    # print out the board
    def print_board
        @game_board.each do |row|
            print "                 "
            row.each do |col|
                print " #{col} "
            end
            print "\n"
        end
        print "\n\n"
    end

    def make_game_board_pos
        game_board_pos = [["(0,0)", "(0,1)", "(0,2)"], ["(1,0)", "(1,1)", "(1,2)"], ["(2,0)", "(2,1)", "(2,2)"]]
        return game_board_pos
    end

    def make_board
        game_board = [["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]
        return game_board
    end

end

def main
    puts "---- Welcome to RUBY TIC TAC TOE ----\n\n"
    tic_tac_toe = TicTacToe.new
    tic_tac_toe.play
    puts "Thanks for playing tic tac toe! Returning to the main menu...\n\n"
end

main
