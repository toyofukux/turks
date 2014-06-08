require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'logger'

module Turks
  class MixiAuth
    MIXI_LOGIN_URL = 'https://mixi.jp/'
    attr_reader :mecha
    def initialize
      @mecha = Mechanize.new { |agent| 
        agent.user_agent_alias = 'Mac Safari'
        agent.follow_meta_refresh = true
        agent.default_encoding = 'EUC-JP'
        agent.force_default_encoding = true
      }
    end
    def authenticate(email, password, next_url='/home.pl')
      @mecha.get(MIXI_LOGIN_URL)
      @mecha.page.form_with(name: 'login_form') { |form|
        form.set_fields(next_url: next_url, email: email, password: password)
      }.click_button
    end
  end
end

