require 'faker'

FactoryGirl.define do
  factory :payment do |f|
  	f.payment_amount {Faker::Number.number(4)}
  end

end