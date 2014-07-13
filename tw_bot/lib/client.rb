require 'yaml'

class Turks
  class Client
    TOKEN_YML = "./config/token.yml"
    attr_reader :rest_client
    attr_reader :streaming_client
    def initialize
      token = YAML.load_file TOKEN_YML
      #@rest_client = Twitter::Streaming
      @streaming_client = Twitter::Streaming::Client.new do |config|
        config.consumer_key = token["twitter"]["consumer_key"]
        config.consumer_secret = token["twitter"]["consumer_secret"]
        config.access_token = token["twitter"]["access_token"]
        config.access_token_secret = token["twitter"]["access_token_secret"]
      end
    end
  end
end
