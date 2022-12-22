require_relative 'BinarySearchTree'

items = [4, 2, 1, 3, 5, 7, 6, 8]

tree = BinaryTree.new
items.each { |x| tree.add(x) }

direct_order = tree.direct_order
reverse_order = tree.reverse_order
symmetrical_order = tree.symmetrical_order

puts "tree size: #{tree.size}"
puts "direct_order: #{direct_order.join(", ")}"
puts "reverse_order: #{reverse_order.join(", ")}"
puts "symmetrical_order: #{symmetrical_order.join(", ")}"
