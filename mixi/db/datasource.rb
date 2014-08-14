require 'rubygems'
require 'active_record'

module Turks
  class DataSource
    DATASOURCE_CONFIG = File.expand_path('../../config/database.yml', __FILE__)
    def self.connenction
      config = YAML.load_file(DATASOURCE_CONFIG)
      environment = ENV["ENV"] ? ENV["ENV"] : "development"
      ActiveRecord::Base.establish_connection(config["db"][environment])
      ActiveRecord::Base.logger = Logger.new(STDOUT)
    end
  end
end

