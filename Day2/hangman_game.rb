# Load dictionaries
load './dictionaries.rb'


# game start with level
def start_game(levels)
  current_level = 0

  while current_level < levels.length
    puts "\n *********** Starting Level #{current_level + 1} **************"
    
    if initialize_game(levels[current_level])
       # Move to next level if successful
      current_level += 1             
    else
       # Exit game if player chooses to exit or loses
      break                          
    end
  end

  if current_level == levels.length
    # Completion message
    puts "\nCongratulations! You've completed all levels!  WINNER !!!"   
  endx
end


def initialize_game(level)
  word, hint = level.to_a.sample
  guessed_letters = []
  wrong_guesses = 0
  max_attempts = 5

  display_hint(hint, word.length)

  while wrong_guesses < max_attempts
    guess = get_user_guess()

    # Exit game if user chooses to quit
    return false if guess == 'exit'  

    next if already_guessed?(guessed_letters, guess)

    guessed_letters << guess
    wrong_guesses += check_guess(word, guess)

    display_word(word, guessed_letters)

    if all_letters_guessed?(word, guessed_letters)
      puts "Congratulations! You've guessed the word '#{word}'. Moving to the next level... \n\n"
       # Move to next level
      return true 
    end

    # Show used letters
    puts "You have used these letters: #{guessed_letters.join(', ')}"  
    puts "You have remaining chances : #{max_attempts-wrong_guesses}"
  end

  # End game message
  puts "\n\n\nGAME OVER! The correct answer was '#{word}'.\n\n"  
  false
end


def display_hint(hint, word_length)
  puts "\n HINT: #{hint}\n"
  puts "- " * word_length
end


def get_user_guess()
  print "\nGuess a letter or type 'exit' to quit: "
  gets.chomp.downcase
end


def already_guessed?(guessed_letters, guess)
  if guessed_letters.include?(guess)
    puts "\nYou have already guessed '#{guess}'. Try again."
    return true
  end
  false
end


def check_guess(word, guess)
  if word.downcase.include?(guess)
    puts "Correct Guess!"
    # No wrong guesses incremented
    return 0  
  else
    puts "Wrong guess :("
    # Increment wrong guesses count
    return 1   
  end
end


def display_word(word, guessed_letters)
  displayed_word = word.chars.map do |char|
    guessed_letters.include?(char.downcase) ? char : '-'
  end.join(' ')
  # Print current state of the word
  puts displayed_word  
end


def all_letters_guessed?(word, guessed_letters)
  word.chars.all? { |char| guessed_letters.include?(char.downcase) }
end


# Start the game with defined levels.
# Define levels to play through
levels = [LEVEL1, LEVEL2, LEVEL3, LEVEL4, LEVEL5]  
start_game(levels)
