FactoryGirl.define do
  factory :currency do
    sequence(:name) { |n| "Name #{n}" }
  end
end
