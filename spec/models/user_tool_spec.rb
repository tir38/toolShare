# == Schema Information
#
# Table name: user_tools
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  tool_id    :integer
#

require 'spec_helper'

describe UserTool do
  before (:each) do
    @testUserTool = FactoryGirl.create(:user_tool)
  end

  it{ should respond_to (:user_id)}
  it{ should respond_to (:tool_id)}

  it "should be valid" do
    @testUserTool.should be_valid
  end

  it "should not be valid without user id" do
    @testUserTool.user_id = NIL
    @testUserTool.should_not be_valid
  end

  it "should not be valid without tools id" do
    @testUserTool.tool_id = NIL
    @testUserTool.should_not be_valid
  end
end
