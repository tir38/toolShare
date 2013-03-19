# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  # validations
    validates :name, presence: true, length: {maximum: 50}
    VALID_EMAIL_REGEX = / \A          # match start of a string
                        [\w+\-.]+     # at least one word character, plus, hyphen, or dot
                        @             # @ character
                        [a-z\d\-.]+   # at least one letter, digit, hyphen, dot
                        \.            # . character
                        [a-z]+        # at least one letter
                        \z            # match end of string
                        /x            # ignore whitespaces in this regex

    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: {minimum: 6}
    validates :password_confirmation, presence: true

  # relationships
    has_many :userTools
    has_many :tools,  :through => :userTools

  # before saves
    before_save {|user| user.email = email.downcase} # ensures that email is saved in all lowercase

  # accessible attributes (not all of these attributes have DB entries)
    attr_accessible :name, :email, :password, :password_confirmation
    has_secure_password # pulls in needed secure_password.rb toolbox


end
