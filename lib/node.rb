
class Node
  attr_reader :value,
              :children,
              :child,
              :weight
  attr_accessor :complete_word

  def initialize(value, complete_word = false)
    @value = value
    @children = Hash.new(nil)
    @complete_word = complete_word
    @weight = 0
  end

  def set_children(key, node)
    @children[key.to_sym] = node
  end

  def child(key)
    children[key.to_sym]
  end

  def complete_word?
    @complete_word
  end
end


# @root.child(:p).child(:i).child(:z).child(:z).child(:a)
