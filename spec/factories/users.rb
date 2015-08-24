require 'faker'

FactoryGirl.define do
  factory :user do |f|
  	f.user_name { Faker::Name.name}
  	f.first_name { Faker::Name.first_name}
  	f.last_name { Faker::Name.last_name}
  	f.client_income {Faker::Number.number(4)}
  	f.email { Faker::Internet.email }
  	f.password { Faker::Number.number(8)}
    
  end

end
