require 'twitter'
require 'logger'
require './lib/client'

logger = Logger.new 'logs/bot.log'

client = Turks::Client.new
rest_client = client.rest_client
str_client = client.streaming_client
str_client.user(replies: "all") do |obj|
  if obj.is_a?(Twitter::Tweet) && "is_not_bot" == obj.in_reply_to_screen_name
    text = "@#{obj.user.screen_name} 会社は学校じゃねぇんだよ！"
    rest_client.update(text, in_reply_to_status_id: obj.id)
    logger.info "replied. text=#{text}"
  end
end
