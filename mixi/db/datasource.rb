require 'rubygems'
require 'active_record'

module Turks
  class DataSource
    DATASOURCE_CONFIG = File.expand_path('../../config/database.yml', __FILE__)
    def self.connenction
      config = YAML.load_file(DATASOURCE_CONFIG)
      environment = ENV["ENVIRONMENT"] ? ENV["ENVIRONMENT"] : "development"
      ActiveRecord::Base.establish_connection(config["db"][environment])
    end
  end
end

