require File.expand_path('../auth.rb', __FILE__)
module Turks
  class Topics
    BASEURL_ADD = "http://mixi.jp/add_bbs.pl?id="
    def self.add(auth, commid, title, description)
      auth.get "#{BASEURL_ADD}#{commid}"
      fields = {bbs_title: title, bbs_body: description}
      form = auth.set_form_by_name("bbs_form", fields)
      form.click_button
      form = auth.set_form_by_action("add_bbs.pl?id=#{commid}")
      form.click_button
    end
  end
end
