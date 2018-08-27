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
    @whole_words = []
    @whole_words << complete_word
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

  def populate(dictionary)
     @words = dictionary.split("\n")
      @words.map do |word|
      insert(word.chomp)
    end
  end 

  def count(current_node = @root)
    @whole_words.count && @words.count
  end

  def suggest(prefix)
    limiter = (prefix.length) -1
    suggested = @words.keep_if do |word|
      word[0..limiter].include?(prefix)
    end
    suggested
  end
end
