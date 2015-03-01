class Currency < ActiveRecord::Base
  has_many :countries

  def self.import
    Currency.destroy_all
    Country.destroy_all
    currencies = CurrencyAPI.get_currencies
    currencies.each do |currency|
      curr = Currency.find_or_create_by(name: currency['Currency'])
      Country.create( name: currency['Name'],
                      country_code: currency['CountryCode'],
                      currency_code: currency['CurrencyCode'],
                      currency: curr)
    end
  end
end
