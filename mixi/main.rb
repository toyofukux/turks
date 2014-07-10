require 'logger'
require './auth'
require './user'
require './db/datasource'
require './model/sequence'
require './file_attach'
require './image_select'

COMMUNITY_ID = 6202896

logger = Logger.new 'logs/authenticate.log'
logger.level = Logger::INFO

user = Turks::MixiUser.new
auth = Turks::MixiAuth.new
auth.authenticate(user.email, user.password)

seq = 0
begin
  Turks::DataSource.connenction
  seq = Sequence.where(community: COMMUNITY_ID).first
rescue => e
  logger.info "cannot find sequence, message=#{e.message}"
  logger.info e.backtrace
end

# get topics page
auth.mecha.get("http://mixi.jp/view_bbs.pl?comm_id=#{COMMUNITY_ID}&id=#{seq.topics}")

# check max comment
# add topics

# post comment
begin
  auth.mecha.page.form_with(name: "bbs_comment_form") { |form|
    # TODO:parse comment content from file or db
    form.set_fields(comment: "日本語の投稿テスト")
    Turks::FileAttatch.attach(form, Turks::ImageSelect.random)
  }.click_button
rescue
  logger.info auth.mecha.page
  fail
end

logger.info "has completed uploading comment."

