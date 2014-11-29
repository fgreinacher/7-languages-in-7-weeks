class Tree
  attr_accessor :name, :children

  def initialize(name, children)
    @name = name
    @children = children.keys.map { |x| Tree.new(x, children[x]) }
  end

  def visit_all(&block)
    visit &block
    @children.each { |x| x.visit_all &block }
  end

  def visit(&block)
    block.call(self)
  end
end

tree = Tree.new('Germany', { 
  'Bavaria' => { 
    'Munich' => { }, 
    'Nuremberg' => { }
  }, 
  'Berlin' => { } 
})

tree.visit_all { |x| puts x.name }
