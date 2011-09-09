module Installer
  class Mongodb
    include Template
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
      write_tempfile("mongodb-start")
    end
    
    def temp_stop_file
      write_tempfile("mongodb-stop")
    end
    
    def temp_init_file
      write_tempfile("mongodb-init")
    end
    
    def temp_config_file
      write_tempfile('mongodb.conf')
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
  end
end
