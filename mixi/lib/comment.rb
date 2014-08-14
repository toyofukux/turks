require 'logger'
require File.expand_path('../auth.rb', __FILE__)
require File.expand_path('../user.rb', __FILE__)
require File.expand_path('../../db/datasource.rb', __FILE__)
require File.expand_path('../file_attach.rb', __FILE__)
require File.expand_path('../image_select.rb', __FILE__)
require File.expand_path('../model/topic.rb', __FILE__)
require File.expand_path('../topics.rb', __FILE__)

logger = Logger.new File.expand_path('../../logs/comment.log', __FILE__)
logger.level = Logger::INFO

user = Turks::MixiUser.new
agent = Turks::MixiAuth.new
agent.authenticate(user.email, user.password)

topics = ""
begin
  Turks::DataSource.connenction
  # TODO:for, index, select
  topics = Topic.where(is_suspended: "0").first
rescue => e
  logger.info "cannot find sequence, message=#{e.message}"
  logger.info e.backtrace
end

# get topics page
agent.get("http://mixi.jp/view_bbs.pl?comm_id=#{topics.community_id}&id=#{topics.topic_id}")

# check max comment
over_limit = agent.mecha.page.search('div.overLimit')
if over_limit.present?
  Turks::Topics.add(agent, topics.community_id, topics.title, topics.description)
  href = ""
  agent.mecha.page.links.each do |link|
    href = link.href if link.href =~ /^view_bbs/
  end
  # ex: view_bbs.pl?id=76806419&comm_id=6211127 at <div class="overLimit">
  /\?id=(\d+)/ =~ href
  topic.update_attribute(:topic_id, $1.to_i)
  logger.info("new topic id = #{href}")
end

# post comment
begin
  form_name = "bbs_comment_form"
  fields = {comment: topics.comment}
  form = agent.set_form_by_name(form_name, fields)
  Turks::FileAttatch.attach(form, Turks::ImageSelect.random)
  form.click_button
rescue
  logger.info agent.mecha.page
  fail
end

logger.info "has completed uploading comment."

