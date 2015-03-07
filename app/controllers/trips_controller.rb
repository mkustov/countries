class TripsController < ApplicationController
  inherit_resources
  respond_to :js, :html
  load_and_authorize_resource

  protected

  def permitted_params
    params.permit(trip: [:description, :date, :country_ids => []])
  end
end
