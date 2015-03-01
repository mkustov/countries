class Country < ActiveRecord::Base
  belongs_to :currency
  delegate :name, to: :currency, prefix: true
end
