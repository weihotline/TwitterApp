# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "Johnathan"
    email    "js@example.com"
    password "good_password"
  end
end
