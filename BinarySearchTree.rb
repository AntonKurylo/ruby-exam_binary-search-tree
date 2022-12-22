class BinaryTree
  attr_accessor :root
  attr_accessor :total_nodes

  def initialize(first_value = nil)
    if first_value == nil
      @root = nil
      @total_nodes = 0
    else
      @root = Node.new(first_value)
      @total_nodes = 1
    end
  end

  def add(new_value)
    if @root == nil
      @root = Node.new(new_value)
      @total_nodes = 1
      return
    end

    current = @root
    while true
      if new_value < current.value
        if current.left == nil
          current.left = Node.new(new_value)
          break
        else
          current = current.left
        end
      else
        if current.right == nil
          current.right = Node.new(new_value)
          break
        else
          current = current.right
        end
      end
    end

    @total_nodes += 1
  end

  def size
    @total_nodes
  end

  def direct_order
    preorder(@root, Array.new)
  end

  def reverse_order
    postorder(@root, Array.new)
  end

  def symmetrical_order
    inorder(@root, Array.new)
  end

  # tree traversal in direct order
  private def preorder(root, stack)
    if root == nil
      return stack
    else
      stack << root.value
    end

    preorder(root.left, stack)
    preorder(root.right, stack)
  end

  # tree traversal in reverse order
  private def postorder(root, stack)
    return stack if root == nil

    postorder(root.left, stack)
    postorder(root.right, stack)
    stack << root.value
  end

  # tree traversal in symmetrical order
  private def inorder(root, stack)
    return stack if root == nil

    inorder(root.left, stack)
    stack << root.value
    inorder(root.right, stack)
  end

  class Node
    attr_accessor :left
    attr_accessor :right
    attr_accessor :value

    def initialize(value)
      @left = nil
      @right = nil
      @value = value
    end

    def is_leaf?
      @left == nil && @right == nil
    end

    def has_left_child?
      @left != nil
    end

    def has_right_child?
      @right != nil
    end

  end
end
