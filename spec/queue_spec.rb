require 'spec_helper'

describe "Implementing a queue" do
  let(:q) { MyQueue.new(10) }

  describe "#dequeue" do
    it "should return nil if queue is empty" do
      expect(q.dequeue).to be_nil
    end

    it "should return the head of the queue" do
      add_elements_to_queue
      expect(q.head).to eq(5)
      expect(q.dequeue).to eq(5)
    end

    it "should remove the head from the queue" do
      add_elements_to_queue
      expect(q.data).to eq [nil, nil, nil, nil, 10, 9, 8, 7, 6, 5]
      expect(q.head).to eq(5)
      q.dequeue
      expect(q.data).to eq [nil, nil, nil, nil, nil, 10, 9, 8, 7, 6]
    end
  end

  describe "#enqueue" do
    it "should return nil if the queue is full" do
      fill_queue
      expect(q.enqueue(99)).to be_nil
    end

    it "the head and tail should be the same in queue with one element" do
      q.enqueue("foo")
      expect(q.data).to eq [nil, nil, nil, nil, nil, nil, nil, nil, nil, "foo"]
      expect(q.head).to eq("foo")
      expect(q.tail).to eq("foo")
    end

    it "the head should be the first element enqueued" do
      add_elements_to_queue
      expect(q.head).to eq(5)
    end

    it "the tail should be the last element enqueued" do
      add_elements_to_queue
      expect(q.tail).to eq(10)
    end

    it "should fill the queue correctly" do
      fill_queue
      expect(q.data).to eq [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
    end
  end

  def add_elements_to_queue
    (5..10).each { |n| q.enqueue(n) }
  end

  def fill_queue
    10.times { |n| q.enqueue(n) }
  end
end