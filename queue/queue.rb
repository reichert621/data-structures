class MyQueue
  attr_reader :size, :data
  def initialize(size)
    @size = size
    @data = Array.new(size)
    @head, @tail = -1, 0
  end

  def enqueue(element)
    if full? || element.nil?
      nil
    else
      @tail -= 1
      @data[@tail] = element
      self
    end
  end

  def dequeue
    if empty?
      nil
    else
      @tail += 1
      dequeued = @data[@head]
      @data.unshift(nil)
      @data.pop
      dequeued
    end
  end

  def head
    @data[@head]
  end

  def tail
    @data[@tail]
  end

  private

  def full?
    @tail.abs == @size
  end

  def empty?
    @head == -1 && @tail == 0
  end
end

class MyOtherQueue
  attr_reader :head
  def initialize(size)
    @size = size
    @data = Array.new(size)
    @head = nil
  end

  def enqueue(element)
    raise "Queue is full" if full?
    @head = @head.nil? ? 0 : @head + 1
    @data[@head] = element
    @data
  end

  def dequeue
    raise "Queue is empty" if empty?
    @head = @head.zero? ? nil : @head - 1
    @data.push(nil)
    @data.shift
  end

  def peek
    @data
  end

  private

  def empty?
    @head.nil?
  end

  def full?
    @head == @size
  end
end
