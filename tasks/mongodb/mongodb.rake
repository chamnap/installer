namespace :mongodb do
  desc "Install Mongodb"
  task :install, :version, :installed_directory, :data_directory do |t, args|
    raise "you must run this script with sudo" unless Process.uid == 0
    
    args.with_defaults(:version => "1.8.3",
                      :installed_directory => "/opt/mongodb",
                      :data_directory => "/db_data/mongodb")
    
    mongodb = Installer::Mongodb.new(:version => args.version,
                                      :installed_directory => args.installed_directory,
                                      :data_directory => args.data_directory)
    mongodb.install
  end
  
  desc "Purge Mongodb"
  task :purge, :installed_directory do |t, args|
    raise "you must run this script with sudo" unless Process.uid == 0
    
    args.with_defaults(:installed_directory => "/opt/mongodb")
    
    mongodb = Installer::Mongodb.new(:installed_directory => args.installed_directory)
    mongodb.purge
  end
end
