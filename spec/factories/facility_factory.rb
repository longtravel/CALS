FactoryGirl.define do
  factory :facility, class: Facility do

sequence(:name)       { |n| "Name #{n}" }
sequence(:number)     { |n| 5000 + n }
sequence(:admin_name) { |n| "admin name #{n}" }
sequence(:capacity)   { |n| 10*n*rand.round(1) }
  end

  factory :facilities, class: Facility do
    facilities { create_list(:facility, 50)}
  end

end
