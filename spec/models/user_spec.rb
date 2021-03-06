require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "Associations" do
    it { should have_one(:business) }
  end

  subject { described_class.new(first_name: "alam", first_name: "topani", email: "alam@gmail.com", password: '12345678', password_confirmation: '12345678') }

  describe "Validations" do

    it "is not valid without a first_name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last_name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end