class Tool < ActiveRecord::Base

  validates :name, presence: true

  has_many :userTools
  has_many :users, :through => :userTools
end
