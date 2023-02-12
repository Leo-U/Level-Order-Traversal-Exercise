# this document is the commented & converted to ruby version of this educational resource: https://gist.github.com/mycodeschool/9507131
# some additional code has been added (build_tree and print_tree)

# Node represents a node in the binary tree. `data` can be just a letter like 'H'. `left` and `right` are either nil by default (nil means no left or right child node is present), or are equal to another instance of the Node class, allowing an entire tree to be stored recursively in one node.
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
  #data = Z
  if root.nil?
    root = Node.new(data)
  elsif data <= root.data
    root.left = insert(root.left, data) # the `left` field of `root` is re-written to a new object on line 32
  else
    root.right = insert(root.right, data) # the `right field is re-written in the same way.
  end
  root
end

# builds entire tree using input array.
def build_tree(root, array)
  root = nil
  array.each do |data|
    root = insert(root, data)
    # print_tree(root)
    # puts ''
    # sleep(0.6)
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

root = build_tree(root, ['M','B','Q','Z','A','C','D'])
print_tree(root)
# Print nodes in level order
level_order(root)