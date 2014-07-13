require 'twitter'
require './lib/client'

client = Turks::Client.new
p client
rest_client = client.rest_client
str_client = client.streaming_client
str_client.user(replies: "all") do |obj|
  if obj.is_a?(Twitter::Tweet) && "toyodev" == obj.in_reply_to_screen_name
    rest_client.update("@#{obj.user.screen_name} 会社は学校じゃねえ！", in_reply_to_status_id: obj.id)
  end
end
