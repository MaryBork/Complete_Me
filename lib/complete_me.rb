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

  def populate(dictionary)
     @words = dictionary.split("\n")
      @words.map do |word|
      insert(word.chomp)
    end
  end 

  def count(current_node = @root)
    number_of_valid_words = current_node.children.inject(0) do |total, (char, child_node)|
      total + count(child_node)
      end
    return number_of_valid_words + 1 if current_node.complete_word?
    return number_of_valid_words
  end

  def traverse
    #   word = prefix.to_s.join 
    #   current_node = @root
    # until @child.complete_word == true 
    #   word += current_node.value  
    #   current_node = current_node.next_node 
    #   return word 
    #   traverse 
    
  end


  def suggest(prefix)
    # array_of_prefix = prefix.chars
    # bingo = array_of_prefix.map do |element|
    #   element.to_sym 
    # end 
      word = prefix
      current_node = @root
      bank = []
    until current_node.complete_word == true 
      binding.pry
      current_node = current_node.next_node 
      word += current_node.value  
    #suggest
    end
    bank << word
    #bingo
    
  end
end
