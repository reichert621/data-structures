require 'spec_helper'

describe "Implementing a stack" do
  let(:size) { 10 }
  let(:stack) { MyStack.new(size) }

  describe "#pop" do
    it "should raise an error if the stack is empty" do
      expect{ stack.pop }.to raise_error("Stack is empty")
    end

    it "should return the popped value" do
      fill_stack
      expect(stack.pop).to eq(9)
    end

    it "should pop off the element at the top of the stack" do
      fill_stack
      top_element = stack.peek
      popped_element = stack.pop
      expect(popped_element).to eq(top_element)
    end

    it "should have a new top element" do
      fill_stack
      old_top_element = stack.peek
      stack.pop
      new_top_element = stack.peek
      expect(new_top_element).to_not eq(old_top_element)
    end
  end

  describe "#push" do
    it "should raise an error if the stack is full" do
      fill_stack
      expect{ stack.push(100) }.to raise_error("Stack is full")
    end

    it "should return a MyStack object after successful push" do
      expect(stack.push("foo").class).to eq(MyStack)
    end

    it "should replace the top item with the last item pushed" do
      stack.push("bar")
      expect(stack.peek).to eq("bar")
    end
  end

  def fill_stack
    size.times { |n| stack.push(n) }
  end
end