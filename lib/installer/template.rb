require 'erb'

module Installer
  class Template
    def self.parse(filename, data)
      ERB.new(File.read(filename)).result(data.get_binding)
    end
  end
end
