require './lib/term.rb'

@comp_hash = {}
@compendium = []


def main_menu
  loop do
    puts "\npress a to add a new word to the dictionary"
    puts "press s to show the dictionary"
    puts "press d to demolish an entry"
    puts "press e to edit an entry"
    puts "press r to search for an entry"
    puts "press x to exit\n"
    choice = gets.chomp
    if choice == "a"
      add_term
    elsif choice == "x"
      exit
    elsif choice == "e"
      edit_term
    elsif choice == "s"
      show_terms
    elsif choice == "d"
      delete_term
    elsif choice == "r"
      search_term
    else
      puts "not a valid option, buckaroo"
    end
  end
end

def add_term
  puts "enter a word"
  word = gets.chomp
  definitions = []

  more_def = "y"
  while more_def == "y" do
    puts "what's that mean?"
    definitions << gets.chomp

    puts "do you want to enter another definition? (y/n)"
    more_def = gets.chomp
  end
  new_term = Term.new({:word => word, :definition => definitions})
  @compendium << new_term
  @comp_hash[word]=definitions
end

def show_terms
  puts "\n"
  @compendium.each do |term|
    puts term.word + ":"
    puts term.definition
    puts "\n"
  end
end

def delete_term
  puts "which word must meet its untimely demise?"
  @comp_hash.each_key do |word|
    puts word
  end
  doomed = gets.chomp
  @comp_hash.each_key do |word|
    if word == doomed
      @comp_hash.delete(word)
    end
  end
end

def edit_term
  puts "\nwhich term must change?\n"
  @comp_hash.each_key do |word|
    puts word
  end
  term_choice = gets.chomp

  if @comp_hash.include?(term_choice) == false
    puts "\nThat word isn't in the dictionary. Try again\n\n"
    edit_term
  end

  puts "enter the new definition for this word"
  new_definition = gets.chomp
  @comp_hash[term_choice] = new_definition
end

def search_term
  puts "tell me the word you'd like to see"
  input = gets.chomp
  @compendium.each do |term|
    if input == term.word
      term
      puts "\n"
      puts term.just_word + ":"
      puts term.just_def
    else
      puts "I don't know that word"
    end
  end
end



main_menu
