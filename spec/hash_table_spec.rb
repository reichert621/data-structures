require 'spec_helper'

describe "Implementing a hash table" do
  let(:hash_table) { MyHashTable.new }

  describe "#hash" do
    it "should return an index value of less than 1000" do
      index = hash_table.hash("foo")
      expect(index).to be < 1000
    end
  end

  describe "#insert" do
    it "should insert the key and value as pair in an array" do
      key, value = "foo", "bar"
      expect(hash_table.insert(key, value)).to eq([["foo", "bar"]])
    end
  end

  describe "#find" do
    it "should fetch a value based on the key input" do
      hash_table.insert("bar", "baz")
      expect(hash_table.find("bar")).to eq("baz")
    end
  end
end