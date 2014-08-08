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
  init_hash = {:word => word, :definitions => definitions}
  new_term = Term.new(init_hash)
  @compendium << new_term
  @comp_hash[word]=definitions
end

def show_terms
  puts "\n"
  @compendium.each do |term|
    term.show_term
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
  show_terms
  term_choice = gets.chomp
  @compendium.each do |term|
    if term.word == term_choice
      term_choice = term
    end
  end

  if @comp_hash.include?(term_choice) == false
    puts "\nThat word isn't in the dictionary. Try again\n\n"
    edit_term
  end

  puts "Enter the number of the definition that must change"
  term_choice.show_term
  number_input = gets.chomp
  term_choice.definition.each_index do |meaning|
    if meaning == number_input
      puts "what will the new definition be?"
      new_def = gets.chomp
      term_choice.definition[meaning] = new_def
    end
  end



  # mutable_definition.definitions.each do |definition|
  #   if definition.index == number_input
  #     puts "enter the new definition"
  #     new_def = gets.chomp
  #     new_def = mutable_definition.definitions[definition]
  #   end
  # end

end

def search_term
  puts "tell me the word you'd like to see"
  input = gets.chomp
  counter = 0
  @compendium.each do |term|
    if input == term.word
      term
      term.show_term
      counter += 1
    end
  if counter == 0
    puts "I don't know that word"
  end
  end
end



main_menu
