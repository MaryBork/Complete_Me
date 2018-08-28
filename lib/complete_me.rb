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
#Initialize A CompleteMe Tree with
#the attributes of an empty node object
#called root and a nested hash called
#selections made of a new hash as a key
#to a second hash pair(w/ defaulted value at 0)
#the first key is a word prefix, the second key is
#a chosen complete word and the value is a weight integer

  def insert(complete_word, current=@root)
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
#insert takes in a complete word and indicates
#by default its placement entry at root or current.
#the complete word is entered into an empty array,
#first letter is assigned to an empty string,
#ruby iterates over said string and onto the next letter,
#which is then assigned to a node, shoveled away and
#replaced by empty string, causing each letter
#of word to be assigned to a node. When no more letters
#and an empty string remains, complete_word is true,
#end method

def count(current_node = @root)
 number_of_valid_words = current_node.children.inject(0) do |total, (char, child_node)|
   total + count(child_node)
   end
 return number_of_valid_words + 1 if current_node.complete_word?
 return number_of_valid_words
end

#goes to current_node and starting at the first(0) index of the array
#counts each consecutive node and returns the total plus 1 to number_of_valid_words
#Returns the number attached to number_of_valid_words


  def populate(dictionary)
     @words = dictionary.split("\n")
      @words.map do |word|
      insert(word.chomp)
    end
  end
#Takes a file in as an argument then splits the file up at the newline characters
#creating an array of individual strings, then inserts(using #insert) each character of each string into
#our retrieval tree as instances of Node

  def suggest(prefix)
    node_path = [] << current_node
    return nil if current_node.nil?
    letters = prefix.chars
    letters.each do |letter|
      if current_node.value == letter
        node_path << current_node
      end

# #   def suggest(prefix)
# #   stash = []
# #   words      = []
# #   current_string = []
# #   unvisited_nodes << current_string.include?(prefix)
# #   current_string << prefix.chars.take(prefix.size-1)
# #   unless prefix_paths(0)
# #     return []
# #   end
# #   until prefix_paths.empty?
# #     node = prefix_paths.pop
# #     current_string.pop and next if current_node == :guard_node
# #     current_string << current_node.value
# #     prefix_paths      << :guard_node
# #   end
# #   if node.complete_word
# #     words << current_string.join
# #     current_node.child.each { |n| unvisited_nodes << n }
# #   end
# #   complete_words
# # end
  end
