module Installer
  autoload :VERSION,  'installer/version'
  autoload :Template, 'installer/template'
  autoload :Mongodb,  'installer/mongodb/mongodb'
end

# load rake scripts
Dir.glob(File.expand_path(File.join(File.dirname(__FILE__), '../tasks/mongodb/*.rake'))) do |c|
  load c
end
