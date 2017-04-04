require 'rspec'
require 'rails_helper'

include RSpec

describe Facility do
  it 'returns true' do
    facility = FactoryGirl.create(:facility, name: 'test')
    expect(facility.name).to eq('test')
  end
end
