namespace :memcached do
  desc "Install memcached"
  task :install, :version do |t, args|
    raise "you must run this script with sudo" unless Process.uid == 0
    
    args.with_defaults(:version => "1.4.5", :installed_directory => "/opt/memcached")
    
    memcached = Installer::Memcached.new(:version => args.version, :installed_directory => args.installed_directory)
    memcached.install
  end
  
  desc "Purge memcached"
  task :purge, :installed_directory do |t, args|
    raise "you must run this script with sudo" unless Process.uid == 0
    
    args.with_defaults(:version => "1.4.5", :installed_directory => "/opt/memcached")
    
    memcached = Installer::Memcached.new(:version => args.version, :installed_directory => args.installed_directory)
    memcached.purge
  end
end
