require 'rails_helper'

RSpec.describe User, type: :model do
  subject { 
    described_class.new(first_name: "foo",
      last_name: "bar", email: "foo@bar.com", phone: "99999999",
      password: "password", password_confirmation: "password") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a first_name" do 
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a last_name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a phone" do
    subject.phone = nil
    expect(subject).to_not be_valid
  end

  it "is not valid a phone with less then 8 digit" do
    subject.phone = "222"
    expect(subject).to_not be_valid
  end

  context "when created" do
    let(:user) { create(:user) }

    it "should have username by default" do
      user.username = 'foobar'
      user.save
      expect(user.username).not_to be('foobar')
    end
  end
end
