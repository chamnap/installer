module Installer
  class Mongodb
    attr_accessor :version, :installed_directory, :data_directory
    
    def initialize(hash)
      hash.each do |key, value|
        send("#{key}=".to_sym, value)
      end
    end
    
    def bin_directory
      installed_directory + "/bin"
    end
    
    def bin_file
      bin_directory + "/mongod"
    end
    
    def start_file
      bin_directory + "/mongodb-start"
    end
    
    def stop_file
      bin_directory + "/mongodb-stop"
    end
    
    def config_directory
      installed_directory + "/config"
    end
    
    def log_file
      data_directory + "/mongodb.log"
    end
    
    def config_file
      config_directory + "/mongodb.conf"
    end
    
    def temp_start_file
      temp_file("mongodb-start")
    end
    
    def temp_stop_file
      temp_file("mongodb-stop")
    end
    
    def temp_init_file
      temp_file("mongodb-init")
    end
    
    def temp_config_file
      temp_file('mongodb.conf')
    end
    
    def server
      `uname -a`.include?("i686") ? "i686" : "x86_64"
    end
    
    def run
      system "#{parse_template('mongodb-install')}"
    end
    
    def get_binding
      binding
    end
    
    private
    def template_path(template_file)
      File.expand_path(File.join(File.dirname(__FILE__), "templates", template_file))
    end
    
    def temp_file(template_file)
      content = parse_template(template_file)
      
      file = Tempfile.new(template_file)
      file.write(content)
      file.close
      file.path
    end
    
    def parse_template(template_file)
      p template_file
      Installer::Template.parse(template_path(template_file), self)
    end
  end
end
