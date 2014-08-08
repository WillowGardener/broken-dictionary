class Term
  attr_reader(:word, :definition)

  def initialize(attributes)
    @word = attributes[:word]
    @definition = attributes[:definition]
  end

  def show_term
    puts @word + ":"
    puts @definition
  end

  def just_word
    @word
  end

  def just_def
    @definition
  end

end
