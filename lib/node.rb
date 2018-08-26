
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

  def set_children(value, node)
    @children[value.to_sym] = node
  end

  def child(key)
    children[key.to_sym]
  end

  def complete_word?
    @complete_word
  end
end



