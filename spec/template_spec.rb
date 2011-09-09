require 'tempfile'
require 'installer/template'

describe Installer::Template do
  before(:all) do
    class A
      include Installer::Template
      def name
        "Chamnap"
      end
      
      def get_binding
        binding
      end
    end
    
    @template_file = Tempfile.new('foo')
    @template_file.write("Hello <%= name %>!")
    @template_file.rewind
  end
  
  after(:all) do
    @template_file.close
    @template_file.unlink
  end
  
  it "should parse the template file" do
    A.new.parse(@template_file.path).should eql("Hello Chamnap!")
  end
  
  it "should write content to the temp file when passing template file" do
    a = A.new
    a.stub(:parse_template).and_return a.parse(@template_file.path)
    tempfile_path = a.write_tempfile(@template_file.path)
    
    File.read(tempfile_path).should == "Hello Chamnap!"
  end
end
