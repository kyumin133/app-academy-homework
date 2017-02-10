class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    new_stack = @stack.dup
    p new_stack
    new_stack
  end
end

s = Stack.new
s.show
s.add(3)
s.show
s.add(4)
s.show
s.remove
s.show
s.remove
s.show
