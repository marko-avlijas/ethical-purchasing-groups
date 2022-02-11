RSpec.shared_examples "product variant" do
  it "is valid" do
    expect(subject).to be_valid
  end

  it "unit must be present" do
    subject.unit = nil
    expect(subject).not_to be_valid
    expect(subject.errors.added? :unit, :blank).to be true
  end

  it "price must be present" do
    subject.price = nil
    expect(subject).not_to be_valid
    expect(subject.errors.added? :price, :not_a_number, value: nil).to be true
  end

  it "price can't be negative" do
    subject.price = -1 
    expect(subject).not_to be_valid
    expect(subject.errors.added? :price, :greater_than, value: -1, count: 0).to be true
  end

  it "price must be greater than 0" do
    subject.price = 0
    expect(subject).not_to be_valid
    expect(subject.errors.added? :price, :greater_than, value: 0, count: 0).to be true
  end
end
