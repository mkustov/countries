module CurrencyAPI
  def self.get_currencies
    result = Service::Management.invoke(:get_currencies, nil)
    if result.success?
      result.data['NewDataSet']['Table']
    else
      []
    end
  end
end
