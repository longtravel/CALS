require 'rspec'
require 'rails_helper'

include RSpec

describe FacilitiesController do

  describe "GET index" do
    it "assigns @facilities" do
      facilities = 50.times { FactoryGirl.create(:facility) }
      get :index
      expect(assigns(:facilities)).to eq([facilities])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe 'show' do
    it ' assigns a facility' do
      facility = FactoryGirl.create(:facility)
      get :show
      expect(assigns(:facility)).to eq([facility])
    end
    it "renders the show template" do
      get :show
      expect(response).to render_template("show")
    end
  end

end
