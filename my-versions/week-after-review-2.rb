# this rewrite (file #2) has been done one week after the completion of the Binary Search Trees project for the purpose of review

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
  if root.nil?
    root = Node.new(data)
  elsif data <= root.data
    root.left = insert_node(root.left, data)
  else
    root.right = insert_node(root.right, data)
  end
  root
end

# now write build_tree()
def build_tree(root, data_array)
  data_array.each do |element|
    root = insert_node(root, element)
  end
  root
end

# now write level_order()
def level_order(root, queue = [root])
  until queue.empty? do
    current = queue.shift
    puts current.data
    sleep 0.5
    queue << current.left unless current.left.nil?
    queue << current.right unless current.right.nil?
  end
end

# the print_tree method
def print_tree(root, prefix = "", is_left = true)
  return if root.nil?
  print_tree(root.right, "#{prefix}#{is_left ? "│ " : " "}", false)
  puts "#{prefix}#{is_left ? "└─" : "┌─"}#{root.data}"
  print_tree(root.left, "#{prefix}#{is_left ? " " : "│ "}", true)
end

# script execution
data_array = ['M','B','Q','Z','A','C']
root = build_tree(root, data_array)

print_tree(root)
level_order(root)