require 'pry'

class CompleteMe
      attr_reader :dictionary
  def initialize
    @words = []
    @found_word = []
    @populated = []
    @dictionary = dictionary


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
  #   split = dictionary.split("\n")
  #     split.map do |word|
  #       @populate << word
  #     end
  #
  # end

end
