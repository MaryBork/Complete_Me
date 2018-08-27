require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def test_it_exists
    node = Node.new(nil)
    assert_instance_of Node, node
  end

  def test_it_has_value
    
    node = Node.new("a")
    assert_equal "a", node.value
  end

  def test_container_for_children
    
    node = Node.new("b")
    expected = {}
    assert_equal expected, node.children
  end

  def test_it_adds_children
  
    node_a = Node.new("a")
    node_b = Node.new("b")
    node_b = Node.new("b")
    node_b = Node.new("b")
    node_a.set_children("b", node_b)
    expected = {b: node_b}
    assert_equal expected, node_a.children
  end

  def test_child

    node_a = Node.new("a")
    node_b = Node.new("b")
    node_c = Node.new("c")
    node_d = Node.new("d")
    node_a.set_children("b", node_b)
    node_a.set_children("c", node_c)
    node_a.set_children("d", node_d)
    assert_equal node_c, node_a.child("c")
    assert_equal node_d, node_a.child("d")
  end

  def test_is_not_word_node_by_default
    
    node = Node.new("a")
    refute node.complete_word?
  end

  def test_can_be_created_as_word_node
    
    node = Node.new("a", true)
    assert node.complete_word?
  end

  def test_non_word_node_can_be_set_as_word_node
  
    node = Node.new("a")
    node.complete_word = true
    assert node.complete_word?
  end
end

