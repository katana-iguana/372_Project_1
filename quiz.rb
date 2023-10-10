=begin
  quiz.rb

  Author:  Evan Ohme
  Course:  CSc372, Fall '23
  Purpose: A short multiple-choice quiz to test your knowledge
           on the Ruby programming language!
=end

class Question
  def initialize(line)
    @question, @opt1, @opt2, @opt3, @opt4, @ans = line
  end

  # Ask this question; print it out and get the answer as input
  # Returns: true if the user answered correctly, false if not
  def ask()
    puts @question
    puts "  a) #{@opt1}"
    puts "  b) #{@opt2}"
    puts "  c) #{@opt3}"
    puts "  d) #{@opt4}\n\n"
    val = ""
    loop do
      print "Your answer (a, b, c, d): "
      val = gets.chomp
      if "abcd".include? val
        break
      else
        puts  "ERROR: Unrecognized answer. Please try again."
      end
    end
    return val == @ans
  end
end

class Quiz
  def initialize()
    @questions = get_questions
    @score = 0
    @num_questions = @questions.length
  end

  # Play this quiz; loop through each question and ask it
  def play()
    @questions.each do |q|
      # ask a question, add to @score if the user answers correctly
      if q.ask
        @score += 1
        print "CORRECT! "
      else
        print "WRONG! "
      end
      puts "Your score is: #{@score}/#{@num_questions}\n\n"
    end

    if @score/@num_questions == 1
      puts "PERFECT SCORE! Good job!\n\n"
    end
  end

  # Read the quiz questions from a text file
  def get_questions()
    questions = Array::new
    File.foreach('questions.txt') do |line|
      line = line.chomp.split('#')
      questions.push(Question.new(line))
    end
    return questions
  end
end

def main()
  puts "---- Welcome to RUBY QUIZ ----\n\n"
  quiz = Quiz.new
  quiz.play
  puts "Thanks for playing RUBY QUIZ!\n\n"
end

if __FILE__ == $0
    main()
end
