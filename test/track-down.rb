# encoding: UTF-8

ENV["RACK_ENV"] = "test"
require "minitest/autorun"
require "rack/test"

require File.expand_path(File.join(File.dirname(__FILE__), "..", "lib", "track-down"))

describe TrackDown::API::V1 do
  include Rack::Test::Methods

  def app
    TrackDown::API::V1.new
  end

  #it "is strict" do
    #get "/62.65.106.43"
    #last_response.status.must_equal 404
  #end

  describe "tracking down" do
    before do
      header "Accept", "application/vnd.track-down-v1+json"
    end

    it "returns details about the IP" do
      get "/62.65.106.43"
      last_response.body.must_equal({
        request: "62.65.106.43",
        ip: "62.65.106.43",
        country_code2: "SE",
        country_code3: "SWE",
        country_name: "Sweden",
        continent_code: "EU",
        region_name: "28",
        city_name: "Göteborg",
        postal_code: "",
        latitude: 57.7167,
        longitude: 11.966700000000003,
        dma_code: nil,
        area_code: nil,
        timezone: "Europe/Stockholm"}.to_json)
    end
  end
end
