# second attempt to rewrite the Level Order Traversal Exercise. completed without checking original 

# write the Node class.
class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

# write the insert_node method
def insert_node(root, data)
  if root.nil?
    root = Node.new(data)
  elsif data <= root.data
    root.left = insert_node(root.left, data)
  else
    root.right = insert_node(root.right, data)
  end
  root
end

# write the build_tree method
def build_tree(data_array)
  root = nil
  data_array.each do |data|
    root = insert_node(root, data)
  end
  root
end

# write the level_order method
def level_order(root)
  return if root.nil?
  queue = []
  queue << root
  until queue.empty?
    current = queue.shift
    print current.data
    queue << current.left if !current.left.nil?
    queue << current.right if !current.right.nil?
  end
end

# copy the print_tree method here
def print_tree(root, prefix = "", is_left = true)
  return if root.nil?
  print_tree(root.right, "#{prefix}#{is_left ? "│ " : " "}", false)
  puts "#{prefix}#{is_left ? "└─" : "┌─"}#{root.data}"
  print_tree(root.left, "#{prefix}#{is_left ? " " : "│ "}", true)
end

root = build_tree(['F','D','J','B','E','G','K','A','C','I','H'])
print_tree(root)
level_order(root)