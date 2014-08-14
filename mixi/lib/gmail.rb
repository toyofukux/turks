require 'yaml'
require 'gmail'
module Turks
  class Mail
    GMAIL_YAML = File.expand_path('../../config/gmail.yml', __FILE__)
    def self.mail(addr, sub, text)
      conf = YAML.load_file GMAIL_YAML
      Gmail.new(conf["gmail"]["username"], conf["gmail"]["password"]) do |gmail|
        gmail.deliver do
          to addr
          subject sub
          text_part do
            body text
          end
        end
      end
    end
  end
end
