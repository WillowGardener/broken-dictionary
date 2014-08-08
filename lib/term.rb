class Term
  attr_reader(:word, :definitions)

  def initialize(attributes)
    @attributes = attributes
    @word = attributes[:word]
    @definitions = attributes[:definitions]
  end

  def show_term
    puts @word + ":"
    counter = 0
    @definitions.each do |d|
      counter +=1
      puts "#{counter}) #{d}"
    end
  end



end
