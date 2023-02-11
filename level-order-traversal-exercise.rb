# Node represents a node in the binary tree. `data` is just the letters in the tree. `left` and `right` are references to its left and right child nodes.
class Node
  attr_accessor :data, :left, :right
  
  def initialize(data = nil, left = nil, right = nil)
  @data = data
  @left = left
  @right = right
  end

end

# takes the root node of a binary tree as input and prints its nodes in level order, using a queue data structure to keep track of the nodes to be processed.
def level_order(root)
  return if root.nil?
  queue = []
  queue.push(root)
  while !queue.empty? # i.e. while there is at least one discovered node
    current = queue.shift
    print "#{current.data} " # visits the node
    queue.push(current.left) if !current.left.nil?
    queue.push(current.right) if !current.right.nil?
  end
end

# takes the root node and data of a new node to be inserted into the tree, and returns the updated root node after inserting the new node in the appropriate place.
def insert(root, data)
  if root.nil?
    root = Node.new(data)
  elsif data <= root.data
    root.left = insert(root.left, data)
  else
    root.right = insert(root.right, data)
  end
  root
end

#prints a graphical representation of the tree to the terminal.
def print_tree(root, prefix = "", is_left = true)
  return if root.nil?
  print_tree(root.right, "#{prefix}#{is_left ? "│ " : " "}", false)
  puts "#{prefix}#{is_left ? "└─" : "┌─"}#{root.data}"
  print_tree(root.left, "#{prefix}#{is_left ? " " : "│ "}", true)
end

# Creating an example tree
#     M
#    / \
#   B   Q
#  / \   \
# A   C   Z

root = nil
root = insert(root, 'M')
print_tree(root)
sleep(0.6)
puts ''
root = insert(root, 'B')
print_tree(root)
sleep(0.6)
puts ''
root = insert(root, 'Q')
print_tree(root)
sleep(0.6)
puts ''
root = insert(root, 'Z')
print_tree(root)
sleep(0.6)
puts ''
root = insert(root, 'A')
print_tree(root)
sleep(0.6)
puts ''
root = insert(root, 'C')
print_tree(root)


# Print nodes in level order
level_order(root)

puts root