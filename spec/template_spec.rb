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
      include Installer::Template
      def name
        "Chamnap"
      end
      
      def get_binding
        binding
      end
    end
    
    A.new.parse(@file.path).should eql("Hello Chamnap!")
  end
end
