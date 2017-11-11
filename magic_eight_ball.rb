require_relative 'data'
require 'colorize'

@answer_history = []

def magic_eight_ball()

  init_magic()

end

def init_magic()

  while true

    puts "=====WELCOME TO THE MAGIC EIGHT BALL=====".yellow
    puts "Type a question to get an answer, or type QUIT to end program."
    puts "> "

    question = STDIN.gets.strip

    case question
      when "QUIT"
        puts "FAREWELL!"
        exit(0)
      when "add_words"
        add_words()
      when "reset_words"
        reset_words()
      when "print_answers"
        print_answers()
      when "view_words"
        view_words()
      else
        generate_answers()
    end
  end

end

def add_words()

  puts "You have a new word you'd like to add, eh?\n[1] Noun\n[2] Verb\n[3] No, thanks!"
  new_word = STDIN.gets.strip.capitalize.to_i

  while true
    case new_word
      when 1
        puts "Feed me a noun: "
        noun = STDIN.gets.strip
          if @nouns.include?(noun)
            puts "That noun is already included."
            return
          else
            puts "You have added #{noun} to word list."
            @nouns << noun
          end
        add_words()
      when 2
        puts "Feed me a verb: "
        verb = STDIN.gets.strip
          if @verbs.include?(verb)
            puts "That verb is already included."
          else
            puts "You have added #{verb} to word list."
            @verbs << verb
          end
        add_words()
      when 3
        init_magic()
      else
        puts "Error, please try again!"
        add_words()
    end
  end

end

def reset_words()

  puts "=====RESET=====".red
  @nouns = @noun_backup
  @verbs = @verb_backup
  puts "You have reset your word list."

end

def print_answers()

  puts "=====YOUR ANSWER HISTORY=====".blue
  @answer_history.each_with_index { |ans, i| puts "[#{i + 1}] #{ans}"}

end

def view_words()

  puts "=====Nouns=====".blue
  @nouns.each_with_index { |n, i| puts "[#{i + 1}] #{n}"}
  puts "=====Verbs=====".blue
  @verbs.each_with_index { |v, i| puts "[#{i + 1}] #{v}"}

  init_magic()

end

def generate_answers()

  random_answer = @random_answers.sample

  puts random_answer

  @answer_history << random_answer

end

if ARGV.any?
  if ARGV.first.downcase === "add_words"
    add_words()
    magic_eight_ball()
  else ARGV.first.downcase === "view_words"
    view_words()
    magic_eight_ball()
  end
else
  magic_eight_ball()
end
