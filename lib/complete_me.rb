require 'pry'

class CompleteMe
      attr_reader :dictionary
  def initialize
    @words = []
    @found_word = []
    @dictionary = File.read("/usr/share/dict/words")

  end

  def insert(word)
    @words << word
    return word
  end

  def count
    @words.count
  end

  def suggest(word_prefix)
     @words.each do |word|
       if word.include?(word_prefix)
          @found_word << word
       end
     end
  end

  # def populate(dictionary)
  #   dictionary = @dictionary.split('\n')
  #   insert(dictionary)
  # end 

end
