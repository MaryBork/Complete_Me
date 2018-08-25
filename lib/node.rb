
class Node
  attr_reader :value,
              :children
  attr_accessor :word

  def initialize(value, word = false)
    @value = value
    @word = word
    @children = Hash.new(nil)
  end

  def set_children(value, node)
    @children[value.to_sym] = node
  end

  def child(key)
    children[key.to_sym]
  end

  def word?
    @word
  end
end



