require 'logger'
require './auth'
require './user'

TOPICS_ID = 1

logger = Logger.new 'logs/authenticate.log'
logger.level = Logger::INFO

user = Turks::MixiUser.new
auth = Turks::MixiAuth.new
auth.authenticate(user.email, user.password)

seq = 0
begin
  seq = Sequence.select(:topics).where(community: TOPICS_ID)
  p seq
rescue => e
  logger.info "cannot find sequence, message=#{e.message}"
  logger.info e.backtrace
end

# get topics page
# check max comment
# add topics
# post comment

