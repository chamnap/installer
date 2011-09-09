module Installer
  class Memcached
    include Template
    attr_accessor :version, :installed_directory
    
    def initialize(hash)
      hash.each do |key, value|
        send("#{key}=".to_sym, value)
      end
    end
    
    def bin_directory
      installed_directory + "/bin"
    end
    
    def start_file
      bin_directory + "/memcached-start"
    end
    
    def config_directory
      installed_directory + "/config"
    end
    
    def config_file
      config_directory + "/memcached.conf"
    end
    
    def log_file
      config_directory + "/memcached.log"
    end
    
    def temp_start_file
      write_tempfile("memcached-start")
    end
    
    def temp_init_file
      write_tempfile("memcached-init")
    end
    
    def temp_config_file
      write_tempfile('memcached.conf')
    end
    
    def install
      system parse_template('memcached-install')
    end
    
    def purge
      system parse_template('memcached-purge')
    end
    
    def get_binding
      binding
    end
  end
end
