require 'rspec'
require 'term'

describe Term do
  it "is initialized" do
    test_term = Term.new("elk", "an overly-enthusiastic unicorn")
    expect(test_term).to be_an_instance_of Term
  end
end
