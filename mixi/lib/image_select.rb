require 'find'

module Turks
  class ImageSelect
    DIRECTORY = File.expand_path('../../img', __FILE__)
    def self.random
      Find.find(DIRECTORY).to_a.shuffle!.each do |f|
        # TypeError: no implicit conversion of nil into String
        #if File.file? f && File.extname(f) =~ /(.jpg|.jpeg)/
        if File.file? f
          if File.extname(f) =~ /(.jpg|.jpeg)/
            return f
          end
        end
      end
    end
  end
end

