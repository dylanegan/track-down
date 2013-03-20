require File.join(".", "lib", "track-down")

puts TrackDown::API::V1::routes.inspect
run TrackDown::API::V1
