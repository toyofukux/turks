require 'rubygems'
require 'active_record'
require './model/sequence'

module Turks
  class LoadSeed
    def self.load
      Sequence.find_or_create_by(community: 6202896, topics: 76438154)
    end
  end
end

