require "installer/version"
require 'installer/template'
require 'installer/mongodb/mongodb'
load '/var/www/installer/tasks/mongodb/mongodb.rake'

module Installer
  #auto_load :Mongodb, 'mongodb/mongodb'
  #auto_load :Template, 'mongodb/template'
end
