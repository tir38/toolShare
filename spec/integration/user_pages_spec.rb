require 'spec_helper'

describe "User pages" do

  subject {page}

  describe "signup page" do
    before {visit signup_path}
    let(:submit) {"Create Account"}

    it {should have_selector('h1', text: 'Sign up')}

   describe "signing up without adding any information" do
     it "should not allow signup" do
        expect {click_button submit}.not_to change(User, :count)
     end


     it "should display error message" do
        click_button submit
        page.should have_text("The form contains 7 errors")
     end
   end

    describe "signing up with correct information" do
      before do
        fill_in "Name",     with: "test user"
        fill_in "Email",    with: "test@user.com"
        fill_in "Password", with: "123456"
        fill_in "Confirm",  with: "123456"
      end
      it "should allow signup" do
        expect {click_button submit}.to change(User, :count).by(1)
      end
    end
  end


  describe "profile page" do
    before (:each) do
      @testUser = FactoryGirl.create(:user)
      visit user_path(@testUser)
    end
    it {should have_selector('h1', text: @testUser.name)}
  end
end