require 'rubygems'
require 'nokogiri'
require 'mechanize'

module Turks
  class FileAttatch
    def self.attach form, file
      doc = Nokogiri::XML::Document.parse '<input>'
      input_tag = Nokogiri::XML::Node.new 'input', doc
      input_tag['type'] = 'file'
      input_tag['name'] = 'photo1'
      input_tag['id'] = 'photo1'
      input_tag['value'] = file
      upload = Mechanize::Form::FileUpload.new input_tag, file
      form.file_uploads << upload
    end
  end
end

