module Installer
  autoload :VERSION,  'installer/version'
  autoload :Template, 'installer/template'
  autoload :Mongodb,  'installer/mongodb/mongodb'
  autoload :Memcached, 'installer/memcached/memcached'
end

# load rake scripts
Dir.glob(File.expand_path(File.join(File.dirname(__FILE__), '../tasks/**/*.rake'))) do |c|
  load c
end
