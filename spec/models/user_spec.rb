require 'rails_helper'

RSpec.describe User, type: :model do
  subject { 
    described_class.new(username: "foobar", first_name: "foo",
      last_name: "bar", email: "foo@bar.com", phone: "999999999") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid without a username" do
    subject.username = nil
    expect(subject).to_not be_valid
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
end
