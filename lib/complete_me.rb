require 'pry'
require './lib/node'

class CompleteMe
      attr_reader :root,
                  :selections
  def initialize
    @root = Node.new(nil)
    @selections = {}
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
      complete_word == ("")
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

  def suggest(prefix,word = (""), node = @root)
    if 
      prefix.empty?
      array =[]
      node.children.each do |key, next_node|
      array += suggest(prefix, word + key.to_s, next_node)
    end
  
    if 
      node.complete_word == true
      array << word
    end
      array

    else
      next_prefix = prefix.clone.chars
      next_prefix.shift
      suggest(next_prefix.join, word + prefix[0], node.children[prefix[0].to_sym])
    end  
  end
  
    def weigh_selections(prefix, selection)
        weighted_array = suggest(prefix)
        @selections[prefix] = {}
        weighted_array.each do |suggestion|
          @selections[prefix][suggestion] = 0
        end
        if
         @selections[prefix][selection] += 1
        end
      end

    def select(prefix, selection)
      if @selections.key?(prefix)
        @selections[prefix][selection] >= 1
      else
        weigh_selections(prefix, selection)
      end
    end
end

