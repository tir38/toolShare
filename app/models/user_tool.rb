class UserTool < ActiveRecord::Base

  validates :user_id, presence: true
  validates :tool_id, presence: true

  belongs_to :tool
  belongs_to :user

end
