class CountriesController < ApplicationController
  def index
    filter = params[:filter][:currency] if params[:filter].present?
    @countries = filter.present? ? Country.includes(:currency).where(currency_id: filter) : Country.includes(:currency).all
  end
end
