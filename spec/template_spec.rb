require 'tempfile'
require 'installer/template'

describe Installer::Template do
  before(:all) do
    @file = Tempfile.new('foo')
    @file.write("Hello <%= name %>!")
    @file.close
  end
  
  after(:all) do
    @file.unlink
  end
  
  it "should be able to parse the template file" do
    class A
      class << self
        def name
          "Chamnap"
        end
        
        def get_binding
          binding
        end
      end
    end
    
    Installer::Template.parse(@file.path, A).should eql("Hello Chamnap!")
  end
end
