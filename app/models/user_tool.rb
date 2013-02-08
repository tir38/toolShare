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

class UserTool < ActiveRecord::Base

  validates :user_id, presence: true
  validates :tool_id, presence: true

  belongs_to :tool
  belongs_to :user

end
