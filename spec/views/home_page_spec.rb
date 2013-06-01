require 'spec_helper'

describe "home page" do

  subject {page}

  before do
    visit '/' # visit root
  end

  it {should have_content("This is the static home page.")}
  it {should have_link('Sign Up', href:signup_path)}

end