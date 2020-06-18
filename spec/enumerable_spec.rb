require 'rspec'
require_relative '../main.rb'

describe Enumerable do 
    let(:arr) {Array(1..5)}
    describe "#my_each" do
        it "Must return enum if no block given." do
            expect(arr.my_each).to be_a(Enumerator) 
        end
        it "Must throw argument error if given Arguments ()." do 
            expect{arr.my_each(9)}.to raise_error(ArgumentError)
        end
        it "Must return original array if empty block given {}." do
            expect(arr.my_each{}).to eql(arr.each{})
        end
        it "Must return the same value as each if block given." do
            expect(arr.my_each{|i| puts "Returns #{i}"}).to eql(arr.each{|i| puts "Returns #{i}"})
        end
    end
end
