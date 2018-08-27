require 'pry'
require './lib/node'

class CompleteMe
      attr_reader :root,
                  :selections
  def initialize
    @root = Node.new(nil)
    @selections = Hash.new do |hash, key|
      hash[key] = Hash.new(0)
    end
  end

  def insert(complete_word, current = @root)
    first_letter = complete_word[0]
    complete_word[0] = ("")


    next_node = current.child(first_letter)
      if
        next_node == nil
        next_node = Node.new(first_letter)
        current.set_children(first_letter, next_node)
      end
      if
        complete_word == ""
        next_node.complete_word = true
        return
      end
    insert(complete_word, next_node)
  end

  def include?(word)
    @complete_word
  end

  def count(current = @root)
    num_child_words = current.children.reduce(0) do |total, (char, child_node)|
    total + count(child_node)
    end
    return num_child_words + 1
    if current.complete_word?
      return num_child_words
    end
  end

  # def suggest(word_prefix)
  #    @words.each do |word|
  #      if word.include?(word_prefix)
  #         @found_word << word
  #      end
  #    end
  # end

  def populate(dictionary)
     bingo = dictionary.split("\n")
      bingo.map do |word|
      insert(word.chomp)
      binding.pry
    end
  end

end
