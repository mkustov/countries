require 'currency_api'

class CurrenciesController < ApplicationController
  def index
    currency_name = params[:currency][:currency_name] if params[:currency].present?
    @currencies = currency_name.present? ? CurrencyAPI.get_currency(currency_name) : CurrencyAPI.get_currencies
  end
end
