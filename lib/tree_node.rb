class PolyTreeNode
    attr_reader :parent, :children, :value

  def initialize(value, children = [])
    @parent = nil
    @children = children
    @value = value
  end

  def parent=(new_parent)
   return @parent = nil if new_parent.nil?

   if @parent.nil? # if parent has no child
    @parent = new_parent # rename to the new parent
    new_parent.children << self # add the node to new parent
   elsif !new_parent.children.include?(self) # if current parent does NOT have this node
    @parent.children.delete(self)
    @parent = new_parent 
    new_parent.children << self
   end
  end

  def add_child(other_node)
    other_node.parent = self if !@children.include?(self) || @children.nil?
  end

  def remove_child(node)
    if !self.children.include?(node)
        raise 'node is not a child'
        node.parent = nil
    else
        self.children.delete(node)
        node.parent = nil
    end
  end














end