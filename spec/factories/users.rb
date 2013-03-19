# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Kevin"
    email "kevin@mail.com"
    #password "myPassword"
    #password_confirmation "myPassword"
  end
end
