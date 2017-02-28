class FacilitiesController < ApplicationController
  before_action :find_facility, only: [:show, :update, :edit, :destroy]

  def index
#    @facilities = Facility.all
  end

  def update
    build_facility

    if @facility.save
      flash[:notice] = 'Facility details have been updated'
      render :show
    else
      flash[:error] = 'Sorry, something went wrong updating facility details. Try again.'
      redirect_to action: 'edit', id: @facility
    end
  end

  def create
    @facility = Facility.new(name: '', admin_name: '', number: nil, capacity: nil, approval_date: Time.zone.now)
    build_facility

    if @facility.save
      flash[:notice] = 'Facility has been created successfully'
      render :show
    else
      flash[:error] = 'Sorry, something went wrong creating facility. Try again.'
      redirect_to action: 'new'
    end
  end

  def destroy
    if @facility.destroy
      flash[:notice] = 'Facility has been destroyed successfully'
    else
      flash[:error] = 'Sorry, something went wrong deleting facility. Try again.'
    end
    redirect_to action: 'index'
  end

  private
  def find_facility
    @facility = Facility.find params[:id]
  end

  def build_facility
    @facility.name = params[:facility][:name]
    @facility.number = params[:facility][:number]
    @facility.admin_name = params[:facility][:admin_name]
    @facility.capacity = params[:facility][:capacity]
  end
end