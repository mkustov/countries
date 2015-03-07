class CountriesController < ApplicationController
  inherit_resources
  respond_to :js, :html
  load_and_authorize_resource

  def index
    filter = { :currency_id => params[:filter][:currency] } if params[:filter].present? && params[:filter][:currency].present?
    filter = { visited: params[:visited] } if params[:visited].present?
    @countries = filter.present? ? Country.includes(:currency).where(filter) : Country.includes(:currency).all
    @countries.order!(:name)
  end

  def load_data
    Country.import
    redirect_to countries_path
  end

  def trips
    @countries = Country.where(visited: true)
  end

  protected

  def permitted_params
    params.permit(country: [:name, :visited, :country_code, :currency_code, :currency_id])
  end
end
