module FacilitiesHelper
  def fetch_facilities
    facilities = $redis.get("facilities")
    if facilities.nil?
      facilities = Facility.all.to_json
      $redis.set("facilities", facilities)
      $redis.expire("facilities", 4.hour.to_i)
    end
    @facilities = JSON.load facilities
  end
end
