require 'spec_helper'

describe "Implementing a linked list" do
  let(:list) { MyLinkedList.new }

  describe "#reset" do
    it "should execute when a new linked list is initialized" do
      new_list = MyLinkedList.new
      expect(new_list.head.key).to be_nil
    end

    it "should clear out the linked list" do 
      fill_linked_list
      list.reset
      expect(list.head.key).to be_nil
    end
  end

  describe "#insert" do
    it "the last node inserted should be at the head" do
      fill_linked_list
      expect(list.head.key).to eq("z")
      list.insert("foo")
      expect(list.head.key).to eq("foo")
    end

    it "the new head should point to the old head" do
      list.insert("foo")
      old_head = list.head
      list.insert("bar")
      new_head = list.head
      expect(old_head.key).to eq("foo")
      expect(new_head.key).to eq("bar")
      expect(new_head.next).to eq(old_head)
    end
  end

  describe "#search" do
    it "should fetch a value based on the key input" do
      fill_linked_list
      searched_node = list.search("x")
      expect(searched_node.key).to eq("x")
    end

    it "should raise an error if the key does not exist in the list" do
      fill_linked_list
      nonexistent_key = "zzz"
      expect{ list.search(nonexistent_key) }.to raise_error("This key does not exist")
    end
  end

  describe "rendering a list" do
    it "should render a string representing the linked list" do
      ["foo", "bar", "baz"].each { |str| list.insert(str) }
      rendered_list = list.render_list
      expect(rendered_list).to eq "baz -> bar -> foo -> nil"
    end

    it "the list should end with nil" do
      fill_linked_list
      rendered_list = list.render_list_as_array
      expect(rendered_list.last).to be_nil
    end

    it "the list should start with the head" do
      fill_linked_list
      rendered_list = list.render_list_as_array
      head_key = list.head.key
      expect(rendered_list.first).to eq(head_key)
    end
  end

  def fill_linked_list
    ("a".."z").each do |l|
      list.insert(l)
    end
  end
end