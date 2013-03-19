require 'spec_helper'

describe "new user page" do
  before (:each) do
    visit '/users/new'
  end

  it "should render the page" do

  end

  describe "submitting without form data" do
    it "should not add to database" do

    end

    it  "should redirect to xyz" do

    end
  end

  describe "submitting with correct form data" do
    it "should add one user to database" do

    end

    it "should redirect to page xyz" do

    end
  end

end