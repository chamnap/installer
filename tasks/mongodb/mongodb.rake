namespace :mongodb do
  desc "Install MongoDB"
  task :install, :version, :installed_directory, :data_directory do |t, args|
    raise "you must run this script with sudo" unless Process.uid == 0
    
    server = `uname -a`.include?("i686") ? "i686" : "x86_64"
    args.with_defaults(:version => "1.8.3",
                      :installed_directory => "/opt/mongodb",
                      :data_directory => "/db_data/mongodb")
    
    installer = Installer::Mongodb.new(:version => args.version,
                                      :installed_directory => args.installed_directory,
                                      :data_directory => args.data_directory)
                                      
    installer.run
  end
end
