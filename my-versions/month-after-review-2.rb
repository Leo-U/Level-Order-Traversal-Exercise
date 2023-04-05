# this rewrite (file #2) has been done one month after the completion of the Binary Search Trees project for the purpose of review

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
  elsif data > root.data
    root.right = insert_node(root.right, data)
  end
  root
end


# now write build_tree()

def build_tree(data_array)
  root = nil
  data_array.each do |data_element|
    root = insert_node(root, data_element)
  end
  root
end


# now write level_order()

def level_order(root, queue = [root])
  until queue.empty? do
    current = queue.shift
    puts current.data
    queue << current.left if current.left
    queue << current.right if current.right
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
level_order(root)