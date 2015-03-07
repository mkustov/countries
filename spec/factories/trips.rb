FactoryGirl.define do
  factory :trip do
    sequence(:description) { |n| "Description #{n}" }
    date DateTime.now
  end
end
