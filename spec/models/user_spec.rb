require 'spec_helper'

describe User do

  before (:each) do
    @testUser = FactoryGirl.create(:user)
  end

  subject(@testUser)

  it{ should respond_to(:name)}
  it{ should have_many(:userTools)}
  it{ should have_many(:tools).through(:userTools)}

  it "should be valid" do
    @testUser.should be_valid
  end

  it "should not be valid without name" do
    @testUser.name = ""
    @testUser.should_not be_valid
  end
end
