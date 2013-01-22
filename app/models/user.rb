class User < ActiveRecord::Base
  validates :name, presence: true

  has_many :userTools
  has_many :tools,  :through => :userTools
end
