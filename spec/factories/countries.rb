FactoryGirl.define do
  factory :country do
    sequence(:name) { |n| "Name #{n}" }
    sequence(:country_code) { |n| "Country Code #{n}" }
    sequence(:currency_code) { |n| "Currency Code #{n}" }

    currency
  end
end
