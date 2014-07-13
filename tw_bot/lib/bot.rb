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
    text = "@#{obj.user.screen_name} 会社は学校じゃねぇんだよ！"
    begin
      tweet = rest_client.update("#{text}「#{obj.text.delete("@#{BOT_SCREEN_NAME}").strip}」とか言ってんじゃねぇ！元ネタ→http://ameblo.jp/junpei-1114/entry-11889404525.html", in_reply_to_status_id: obj.id)
      logger.info "replied. text=#{tweet.text}, status_id=#{tweet.id}"
    rescue => e
      logger.error e.backtrace
      tweet = rest_client.update(text, in_reply_to_status_id: obj.id)
      logger.info "replied. text=#{tweet.text}, status_id=#{tweet.id}"
    end
  end
end
