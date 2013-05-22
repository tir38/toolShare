# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#

require 'spec_helper'

describe User do

  before do
    @testUser = FactoryGirl.create(:user)
    #@testUser = User.new(name: "test user", email: "email@email.com", password: "myPassword", password_confirmation: "myPassword")
  end

  subject(@testUser)

  # responders
  it{ should respond_to(:name)}
  it{ should respond_to(:email)}
  it{ should respond_to(:password_digest)}
  it{ should respond_to(:password)}
  it{ should respond_to(:password_confirmation)}
  it{ should respond_to(:authenticate)}

  # relationships
  it{ should have_many(:userTools)}
  it{ should have_many(:tools).through(:userTools)}

  it "with proper attributes, should be valid" do
    @testUser.should be_valid
  end

  it "should not be valid without name" do
    @testUser.name = ""
    @testUser.should_not be_valid
  end

  it "name should not be too long" do
    @testUser.name = "sdfasdffasdffasdfasdflkajsdfaskjhaslkdjhflaskjhdflf" #51 characters
    @testUser.should_not be_valid
  end

  it "should not be valid without email" do
    @testUser.email = ""
    @testUser.should_not be_valid
  end

  it "should have unique email" do
    @userWithDuplicateEmail = User.new
    @userWithDuplicateEmail.name = "otherGuy"
    @userWithDuplicateEmail.email = @testUser.email
    @userWithDuplicateEmail.should_not be_valid
  end

  it "should not be valid without password" do
    @testUser.password = ""
    @testUser.password_confirmation = ""
    @testUser.should_not be_valid
  end

  it "should not be valid if password doesn't match password confirmation" do
    @testUser.password_confirmation = "differentPassword"
    @testUser.should_not be_valid
  end

  it "should not be valid if password confirmation is nil" do
    @testUser.password_confirmation = nil
    @testUser.should_not be_valid
  end

  describe "with too short password" do
    before {@testUser.password = @testUser.password_confirmation = "12345"}       # only 5 characters, too short
    it {should_not be_valid}
  end

  describe "authenticate method" do
    before { @testUser.save }                                      # before starting tests, save testUser
    let(:retrievedUser) {User.find_by_email(@testUser.email)}   # retrieve testUser from DB by his email address

    describe "with valid password" do
      it "should retrieve user" do
        @testUser.should == retrievedUser.authenticate(@testUser.password) # use testUser's password to try to authenticate retrievedUser
      end
    end

    describe "without valid password" do
      # I don't fully understand how these two tests are different
      let (:userWithInvalidPassword) {retrievedUser.authenticate("wrongPassword")}      # create another user but with wrong password

      it {should_not == userWithInvalidPassword}         # are these two lines...
      specify {userWithInvalidPassword.should be_false}   # ... not testing the same thing?
    end
  end
end
