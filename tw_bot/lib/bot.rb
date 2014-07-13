require 'twitter'
require './lib/client'

client = Turks::Client.new
p client
str_client = client.streaming_client
str_client.user do |obj|
  puts obj.text if obj.is_a?(Twitter::Tweet) && obj.text.start_with?('@toyodev')
end
