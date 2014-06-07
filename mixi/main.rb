require 'logger'
require './auth'
require './user'

logger = Logger.new 'logs/authenticate.log'
logger.level = Logger::INFO

user = Turks::MixiUser.new
auth = Turks::MixiAuth.new
auth.authenticate(user.email, user.password)
logger.info auth.mecha.page

# get topics page
# check max comment
# add topics
# post comment

