require 'rubygems'
require 'active_record'
require './model/sequence'
require 'yaml'

module Turks
  class LoadSeed
    def self.load
      current = YAML.load_file "config/current.yml"
      commid = current["mixi"]["commid"]
      topid = current["mixi"]["topid"]
      Sequence.find_or_create_by(community: commid, topics: topid)
    end
  end
end

