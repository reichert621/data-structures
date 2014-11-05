class Node
  attr_accessor :key, :next
  def initialize(key)
    @key = key
  end
end

class MyLinkedList
  attr_accessor :data
  def initialize
    @data = Node.new(nil)
    reset
  end

  def reset
    @data.next = @data
  end

  def head
    @data.next
  end

  def insert(item)
    node = Node.new(item)
    node.next = @data.next
    @data.next = node
  end

  def search(key, node=head)
    return node if node.key == key
    raise "This key does not exist" if node.next == head
    search(key, node.next)
  end

  def render_list(str="", node=head)
    return str << "nil" if node.key.nil?
    str << "#{node.key} -> "
    render_list(str, node.next)
  end

  def render_list_as_array(arr=[], node=head)
    return arr << nil if node.key.nil?
    arr << node.key
    render_list_as_array(arr, node.next)
  end
end