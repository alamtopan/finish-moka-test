require 'rails_helper'

RSpec.describe Business, :type => :model do
  describe "Associations" do
    it { should belong_to(:user) }
    it { should have_many(:items) }
  end

  # it { should accept_nested_attributes_for(:items) }

  subject { described_class.new(name: "alam", address: "lembursitu", city: "sukabumi", user_id: 1) }

  describe "Validations" do

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a address" do
      subject.address = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an city" do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an user id" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end
end