module Lexicon
  extend self
  TEXT = File.read(File.dirname(__FILE__) + '/words.txt')

  @five_letter_words
  @all_words

  def new_word()
    five_letter_words.sample.downcase
  end


  def is_five_letter_word?(word)
    five_letter_words.include?(word)
  end

  private

  def all_words
    TEXT.scan(/^\s*(\w+)\s*$/m).flatten
  end

  def five_letter_words
    @five_letter_words || @five_letter_words = TEXT.scan(/^\s*(\w\w\w\w\w)\s*$/m).flatten
  end


end
