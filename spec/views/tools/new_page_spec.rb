require 'spec_helper'

describe "New Tool Page" do
  before do
    visit '/tools/new'
  end

  let(:submit) {"Add tool"}

  it "should render the page" do
    page.should_not have_content("404")
    page.should_not have_content("Routing Error")
    page.should_not have_content("Template")
  end

  describe "with no form data" do
    it "should not be valid" do
      expect {click_button submit}.not_to change(Tool, :count)
    end
  end

  describe "with form data" do

    it "should add one to database" do
      fill_in "Name", with: "Hammer"
      expect {click_button submit}.to change(Tool, :count).by(1)
    end

  end

end