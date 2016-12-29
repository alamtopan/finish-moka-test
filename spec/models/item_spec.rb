require 'rails_helper'

RSpec.describe Item, :type => :model do
  describe "Associations" do
    it { should belong_to(:business) }
  end

  subject { described_class.new(name: "alam", price: 10000, business_id: 1) }

  describe "Validations" do

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a price" do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an business_id" do
      subject.business_id = nil
      expect(subject).to_not be_valid
    end
  end
end