require 'faker'

FactoryGirl.define do
  factory :loan do |f|
  	f.loan_name {Faker::Number.number(10)}
  	f.loan_amount {Faker::Number.number(10)}
  	f.period {Faker::Number.number(4)}  
  end

end