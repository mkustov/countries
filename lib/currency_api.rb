module CurrencyAPI
  def self.get_currencies
    result = Service::Management.invoke(:get_currencies)
    result.success? ? result.data['Table'] : []
  end

  def self.get_currency(currency_name)
    result = Service::Management.invoke(:get_country_by_currency_code, 'CurrencyCode' => currency_name)
    if result.success?
      result.data.present? ? result.data['Table'] : "Currency '#{currency_name}' not found"
    else
      []
    end
  end
end
