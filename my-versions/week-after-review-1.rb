# this rewrite has been done one week after the completion of the Binary Search Trees project. the purpose is review (my tentative review sched is 1 week, 1 month, 3 months, 1 year)

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
  root # this is the main action of the method. without this, the stack level will be too deep.
end

# now write build_tree()
def build_tree(data_array)
  root = nil
  data_array.each do |el|
    root = insert_node(root, el)
  end
  root
end

# now write level_order()
def level_order(root, queue = [root])
  until queue.empty? do
    current = queue.shift
    puts current.data
    queue << current.left unless current.left.nil?
    queue << current.right unless current.right.nil?
    sleep(0.5)
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
root = build_tree(data_array)
print_tree(root)
puts "level order traversal:"
level_order(root)