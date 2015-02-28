require 'currency_api'

class CurrenciesController < ApplicationController
  def index
    currency_name = params[:currency][:currency_name]
    @currencies = currency_name.present? ? CurrencyAPI.get_currency(currency_name) : CurrencyAPI.get_currencies
  end
end
