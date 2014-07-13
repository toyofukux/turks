require 'twitter'
require 'logger'
require './lib/client'

logger = Logger.new 'logs/bot.log'
BOT_SCREEN_NAME = "is_not_bot"

client = Turks::Client.new
rest_client = client.rest_client
str_client = client.streaming_client
str_client.user(replies: "all") do |obj|
  if obj.is_a?(Twitter::Tweet) && BOT_SCREEN_NAME == obj.in_reply_to_screen_name
    replied = obj.text.delete("@#{BOT_SCREEN_NAME}").strip
    text = "@#{obj.user.screen_name} 会社は学校じゃねぇんだよ！「#{replied}」とか言ってんじゃねぇ！"
    rest_client.update(text, in_reply_to_status_id: obj.id)
    logger.info "replied. text=#{text}"
  end
end
