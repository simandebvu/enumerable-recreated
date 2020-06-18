require 'rspec'
require_relative '../main.rb'

describe Enumerable do 
    let(:arr) {Array(1..5)}
    describe "#my_each" do
        it "Must return enum if no block given." do
            expect(arr.my_each).to be_a(Enumerator) 
        end
        it "Must throw argument error if given arguments ()." do 
            expect{arr.my_each(9)}.to raise_error(ArgumentError)
        end
        it "Must return original array if empty block given {}." do
            expect(arr.my_each{}).to eql(arr.each{})
        end
        it "Must return the same value as each if block given." do
            expect(arr.my_each{|i| puts "Returns #{i}"}).to eql(arr.each{|i| puts "Returns #{i}"})
        end
    end
    describe "#my_each_with_index" do
        it "Must return enum if no block given." do
            expect(arr.my_each_with_index).to be_a(Enumerator)
        end
        it "Must return original array if empty block given {}." do
            expect(arr.my_each_with_index{}).to eql(arr.each_with_index{})
        end
        it "Must return same value as each_with_index if block given." do
            expect(arr.my_each_with_index{|i, v| puts "Index #{i} => value #{v}"}).to eql(arr.each_with_index{|i, v| puts "Index #{i} => value #{v}"})
        end
    end
end
