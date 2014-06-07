require 'yaml'

module Turks
  class MixiUser
    USER_YAML = 'config/user.yml'
    attr_reader :email
    attr_reader :password
    def initialize
      user = YAML.load_file USER_YAML
      @email = user["mixi"]["email"]
      @password = user["mixi"]["password"]
    end
  end
end

