require "geoip"
require "grape"
require "json"

module TrackDown
  def self.geoip
    @geoip ||= GeoIP.new(File.expand_path(File.join(File.dirname(__FILE__), '..', 'vendor', 'GeoLiteCity.dat')))
  end

  module API
    class V1 < Grape::API
      default_format :json
      format :json
      version "v1", using: :header, vendor: "track-down"#, strict: true

      desc "Track down an IP."
      get ":ip", requirements: { ip: /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/ } do
        TrackDown.geoip.city(params[:ip]).to_hash
      end
    end
  end
end
