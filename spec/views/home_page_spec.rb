require 'spec_helper'

describe "home page" do
  before do
    visit '/' # visit root
  end

  it "should display correct text" do
    page.should have_content("This is the static home page.")

  end
end