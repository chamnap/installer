module Installer
  class Mongodb
    include Template
    attr_accessor :version, :installed_directory, :data_directory
    
    def initialize(hash)
      hash.each do |key, value|
        send("#{key}=".to_sym, value)
      end
    end
    
    def config_directory
      installed_directory + "/config"
    end
    
    def log_directory
      installed_directory + "/logs"
    end
    
    def log_file
      log_directory + "/mongodb.log"
    end
    
    def config_file
      config_directory + "/mongodb.conf"
    end
    
    def temp_init_file
      write_tempfile("mongodb-init")
    end
    
    def server
      `uname -a`.include?("i686") ? "i686" : "x86_64"
    end
    
    def install
      system parse_template('mongodb-install')
    end
    
    def purge
      system parse_template('mongodb-purge')
    end
    
    def get_binding
      binding
    end
  end
end
