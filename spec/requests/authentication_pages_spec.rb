require 'spec_helper'

describe "AuthenticationPages" do

  subject {page}

  describe "sign in page" do
    before {visit signin_path}

    it {should have_selector('h1', text: 'Sign in')}

    describe "invalid sign in with no information" do
      before {click_button "Sign in"}

      it {should have_selector('h1', text: 'Sign in')}
      it {should have_selector('div.alert.alert-error', text: 'Invalid')}

      # it should not display error message on any further pages
      describe "persistence of error message on next page" do
        before {visit root_path}
        it {should_not have_selector('div.alert.alert-error')}
      end
    end

    describe "invalid sign in with bad email"    do

    end

    describe "invalid sign in with bad password" do

    end

    describe "valid sign in" do
      let (:testUser) {FactoryGirl.create(:user)}
      before do
        fill_in "Email",    with: testUser.email.upcase # fill in email
        fill_in "Password", with: testUser.password# fill in p/w
        click_button "Sign in"
      end

      it {should have_selector('h1', text: testUser.name)}      # should have user's name
      it {should have_link('Sign out', href: signout_path)}      # should have sign out link
      it {should_not have_link('Sign in', href: signin_path)}  # should not have sign in link
    end
  end
end
