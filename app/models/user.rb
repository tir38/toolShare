# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

class User < ActiveRecord::Base
  validates :name, presence: true

  has_many :userTools
  has_many :tools,  :through => :userTools
end
