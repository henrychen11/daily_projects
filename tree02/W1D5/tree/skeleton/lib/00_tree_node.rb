class PolyTreeNode
  attr_reader :value, :children, :parent
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    return if @parent == node
    self.parent.children.delete(self) unless @parent.nil?
    @parent = node
    @parent.children << self unless @parent.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "ERROR" unless self.children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    p '======'
    p value
    p target_value
    p value == target_value
    p '========'
    return self if value == target_value
    children.each do |child|
       child.dfs(target_value)
    end
    p "---------"
    nil
  end

  def bfs(target_value)
    return self if self.value == target_value
  end

end


# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")
#
# # connect n3 to n1
# n3.parent = n1
# #debugger
# # connect n3 to n2
# n3.parent = n2
# p n1
# p n2
# p n3
# # this should work
# raise "Error 1" unless n3.parent == n2
# raise "Error 2" unless n2.children == [n3]
#
#
# # this probably doesn't
