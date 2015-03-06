class TripsController < ApplicationController
  inherit_resources
  respond_to :js, :html

  protected

  def permitted_params
    params.permit(trip: [:description, :date, :country_ids => []])
  end
end
