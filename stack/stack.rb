class MyStack
  attr_reader :data, :size
  def initialize(size)
    @size = size
    @data = Array.new(@size)
    @top = -1
  end

  def push(element)
    raise "Stack is full" if full?
    @top += 1
    @data[@top] = element
    self
  end

  def pop
    raise "Stack is empty" if empty?
    popped = @data[@top]
    @data[@top] = nil
    @top -= 1
    popped
  end

  def peek
    @data[@top]
  end

  private

  def empty?
    @top == -1
  end

  def full?
    @top == (@size - 1)
  end
end