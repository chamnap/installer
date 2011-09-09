module Installer
  autoload :VERSION,  'installer/version'
  autoload :Template, 'installer/template'
  autoload :Mongodb,  'installer/mongodb/mongodb'
end

load File.expand_path(File.join(File.dirname(__FILE__), '../tasks/mongodb/mongodb.rake'))
