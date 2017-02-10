require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("chocolate", 10, chef) }

  describe "#initialize" do

    it "sets a type" do
      expect(dessert.type).to_not eq nil
    end

    it "sets a quantity" do
      expect(dessert.quantity).to_not eq nil
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq []
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("chocolate", 3.5, chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do

    it "adds an ingredient to the ingredients array" do
      test_str = "test"
      dessert.add_ingredient(test_str)
      expect(dessert.ingredients.last).to eq test_str
    end
  end

  describe "#mix!" do
    let(:ingredients) { ["flour", "eggs", "sugar", "vanilla", "baking soda", "cinnamon"] }

    it "shuffles the ingredient array" do
      ingredients.each { |el| dessert.add_ingredient(el) }
      dessert.mix!
      expect((dessert.ingredients - ingredients).empty? && (dessert.ingredients != ingredients)).to eq true
    end
  end

  describe "#eat" do

    it "subtracts an amount from the quantity" do
      old_quantity = dessert.quantity
      eat_amount = 5
      dessert.eat(eat_amount)
      expect(dessert.quantity).to eq (old_quantity - eat_amount)
    end

    it "raises an error if the amount is greater than the quantity" do
      eat_amount = 12
      expect { dessert.eat(eat_amount) }.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      test_name = "chef's name"
      allow(chef).to receive(:titleize).and_return(test_name)
      expect(dessert.serve =~ /^#{test_name}/ ).to_not be nil
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).and_return(Dessert.new(dessert.type, dessert.quantity, chef))
    end
  end
end
