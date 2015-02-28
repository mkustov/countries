require 'currency_api'

class CurrenciesController < ApplicationController
  def index
    @currencies = CurrencyAPI.get_currencies
  end
end
