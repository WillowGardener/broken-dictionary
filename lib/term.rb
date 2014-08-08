class Term
  def initialize(word, definition)
    @word = word
    @definition = definition

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
