class Run < ApplicationRecord
  belongs_to :user
  before_create :find_city
  before_create :coordinates_fixer
  before_create :false_bools

  private

  def coords_to_points(coords_array)
    coords_array.map do |coord_pair|
      ActiveRecord::Point.new(coord_pair[:longitude], coord_pair[:latitude])
    end
  end

  def coordinates_fixer
    self.coordinates = coords_to_points(coordinates)
  end

  def find_city
    starting_point = self.coordinates[0]
    url = "https://geocode.xyz/#{starting_point["latitude"]},#{starting_point["longitude"]}?geoit=json"
    resp = RestClient::Request.execute(url: url, method: "GET")
    resp_obj = JSON.parse(resp)

    self.city = resp_obj["city"] ? resp_obj["city"].titlecase : "No city available"
  end

  def false_bools
    self.completed = false
    self.finalized = false
  end
end
