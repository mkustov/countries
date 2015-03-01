class CountriesController < ApplicationController
  inherit_resources
  respond_to :html, :js

  def index
    filter = params[:filter][:currency] if params[:filter].present?
    @countries = filter.present? ? Country.includes(:currency).where(currency_id: filter) : Country.includes(:currency).all
    @countries.order!(:name)
  end

  def update
    update! { countries_path }
  end

  def load_data
    Country.import
    redirect_to countries_path
  end

  protected

  def permitted_params
    params.permit(country: [:name, :visited, :country_code, :currency_code, :currency_id])
  end
end
