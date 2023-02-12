# first attempt to rewrite original. required some checking of the original to figure some of it out

# start with the Node class
class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end
end

# now write insert_node()
def insert_node(root, data)
  if root == nil
    root = Node.new(data)
  elsif data <= root.data
    root.left = insert_node(root.left, data)
  else
    root.right = insert_node(root.right, data)
  end
  root
end

# now write build_tree()
def build_tree(character_array)
  root = nil
  character_array.each do |el|
    root = insert_node(root, el)
  end
  root
end

# now write level_order()
def level_order(root)
  return if root.nil?
  queue = []
  queue << root
  while !queue.empty? do
    current = queue.shift
    puts current.data
    queue << current.left if !current.left.nil?
    queue << current.right if !current.right.nil?
  end
end


# the print_tree method:
def print_tree(root, prefix = "", is_left = true)
  return if root.nil?
  print_tree(root.right, "#{prefix}#{is_left ? "│ " : " "}", false)
  puts "#{prefix}#{is_left ? "└─" : "┌─"}#{root.data}"
  print_tree(root.left, "#{prefix}#{is_left ? " " : "│ "}", true)
end

root = build_tree(['M','B','Q','Z','A','C'])

print_tree(root)
level_order(root)
