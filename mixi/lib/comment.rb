require File.expand_path('../file_attach.rb', __FILE__)
require File.expand_path('../image_select.rb', __FILE__)

module Turks
  class Comment
    def self.max?(agent, community_id, topic_id)
      agent.get("http://mixi.jp/view_bbs.pl?comm_id=#{community_id}&id=#{topic_id}")
      agent.search('div.overLimit').present?
    end
    def self.post(agent, f_name, comment)
      form_name = f_name
      fields = {comment: comment}
      form = agent.set_form_by_name(form_name, fields)
      Turks::FileAttatch.attach(form, Turks::ImageSelect.random)
      form.click_button
    end
  end
end

