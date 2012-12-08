describe Paperback::Configuration do
  class MyConfigurableClass
    include Paperback::Configuration
  end
  
  let(:configurable) { MyConfigurableClass.new }

  it "should set accessors" do
    configurable.respond_to?(:key=).should be_true
  end

  it "should set return a default configuration" do
    configurable.reset
    configurable.configuration[:endpoint].should eq("https://www.goodreads.com")
  end

  it "should be configurable" do
    configurable.configure do |c|
      c.key = "another_key" 
    end
    configurable.key.should eq("another_key")
  end
end
