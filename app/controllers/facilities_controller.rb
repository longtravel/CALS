class FacilitiesController < ApplicationController
  include Response
  include FacilitiesHelper

  def index
    @facilities = fetch_facilities
    respond_to do |format|
      format.html
      format.js
      format.json {render json: @facilities, status: :ok}
    end
  end
  def show
    @facility = find_facility
    respond_to do |format|
      format.html
      format.js
      format.json {render json: @facility, status: :ok}
    end
  end

  def search
    @facilities = Facility.search_results(params[:query])
    json_response @facilities
  end

  private
  def find_facility
    @facility ||= Facility.find params[:id]
  end
end
