# == Schema Information
#
# Table name: tools
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

class Tool < ActiveRecord::Base

  attr_accessible :name

  validates :name, presence: true

  has_many :userTools
  has_many :users, :through => :userTools
end
