
class Node
  attr_reader :value,
              :children,
              :child
  attr_accessor :complete_word

  def initialize(value, complete_word = false)
    @value = value
    @children = Hash.new(nil)
    @complete_word = complete_word
  end
  #initialize a node with attributes of a value and a word flag

  def set_children(value, node)
    @children[value.to_sym] = node
  end
  #create a new hash with the key set as a node "value"(as symbol)
  #and a value of a node(which has a value and a word flag)


  def child(key)
    children[key.to_sym]
  end
  #This method accesses the value or node of our children hash key

  def complete_word?
    @complete_word
  end
  #Returns the boolean value assigned
  #to the node attribute complete_word
end
