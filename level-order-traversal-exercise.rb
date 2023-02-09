class Node
  attr_accessor :data, :left, :right
  
  def initialize(data = nil, left = nil, right = nil)
  @data = data
  @left = left
  @right = right
  end

end
  
def level_order(root)
  return if root.nil?
  queue = []
  queue.push(root)
  while !queue.empty?
    current = queue.shift
    print "#{current.data} "
    queue.push(current.left) unless current.left.nil?
    queue.push(current.right) unless current.right.nil?
  end
end

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

# Creating an example tree
# M
# / \
# B Q
# / \ \
# A C Z
root = nil
root = insert(root, 'M')
root = insert(root, 'B')
root = insert(root, 'Q')
root = insert(root, 'Z')
root = insert(root, 'A')
root = insert(root, 'C')

# Print nodes in level order
level_order(root)