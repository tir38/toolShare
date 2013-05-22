# == Schema Information
#
# Table name: tools
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

require 'spec_helper'

describe Tool do
  before(:each) do
    @testTool = FactoryGirl.create(:tool)# create tools factory
  end

  subject (@testTool)

  it {should respond_to(:name)}
  it {should have_many(:userTools)}
  it {should have_many(:users).through(:userTools)}

  it "should be valid" do
    @testTool.should be_valid
  end

  it "should not be valid without name" do
    @testTool.name = ""
    @testTool.should_not be_valid
  end


end


