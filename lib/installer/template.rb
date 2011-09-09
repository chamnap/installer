require 'erb'

module Installer
  module Template
    def parse(filename)
      ERB.new(File.read(filename)).result(self.get_binding)
    end
    
    def write_tempfile(template_filename)
      content = parse_template(template_filename)
      
      file = Tempfile.new(template_filename)
      file.write(content)
      file.close
      file.path
    end
    
    private
    def template_path(template_filename)
      File.expand_path(File.join(File.dirname(__FILE__), self.class.name.split("::").last.downcase, "templates", template_filename))
    end
    
    def parse_template(template_filename)
      p "-------"
      parse(template_path(template_filename))
    end
  end
end
