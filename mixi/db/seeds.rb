require 'rubygems'
require 'active_record'
require 'yaml'
require File.expand_path('../../lib/model/topic.rb', __FILE__)

module Turks
  class LoadSeed
    def self.truncate
      Topic.connection.execute("DELETE FROM topics;")
    end
    def self.load
      #commid = 6211127
      commid = 6211921
      topid = 76843360
      title = "☆★渋谷フルコース4000円☆★"
      description = ""
      File.open(File.expand_path('../description_color.txt', __FILE__)) { |f|
        description = f.read
      }
      comment = "詳細送ります(=´∀｀)人(´∀｀=)"
      topic = Topic.where(community_id: commid, topic_id: topid)
      if topic.present?
        puts 'present.'
      else
        Topic.create(community_id: commid, topic_id: topid, title: title, description: description, comment: comment)
      end
      #topid = 76806357
      #topic = Topic.where(community_id: commid, topic_id: topid)
      #if topic.present?
      #  puts 'present.'
      #else
      #  Topic.create(community_id: commid, topic_id: topid, title: title, description: description, comment: comment)
      #end
    end
  end
end

