require File.expand_path('../agent.rb', __FILE__)
require File.expand_path('../../db/datasource.rb', __FILE__)
module Turks
  class Topics
    BASEURL_ADD = "http://mixi.jp/add_bbs.pl?id="
    def self.add(agent, topics)
      agent.get "#{BASEURL_ADD}#{topics.community_id}"
      fields = {bbs_title: topics.title, bbs_body: topics.description}
      form = agent.set_form_by_name("bbs_form", fields)
      form.click_button
      form = agent.set_form_by_action("add_bbs.pl?id=#{topics.community_id}")
      form.click_button
      topid = new_topic_id agent.links
      topics.update_attribute(:topic_id, topid)
    end
    def self.active_topics
      Turks::DataSource.connenction
      Topic.where(is_suspended: "0")
    end
    def self.max?(agent, community_id, topic_id)
      agent.get("http://mixi.jp/view_bbs.pl?comm_id=#{community_id}&id=#{topic_id}")
      agent.search('div.overLimit').present?
    end
    private
    def new_topic_id(links)
      links.each do |l|
        next if /^view_bbs/ !~ link.href
        /\?id=(\d+)/ =~ link.href
        return $1.to_i
      end
    end
  end
end
