require 'spec_helper'

describe Paperback::Auth::Personal do
  let(:request_handler) do
    Paperback::Auth::Personal.new(client)
  end

  context "configuration" do
    it "should have a valid configuratoin if key present" do
      request_handler.configuration_valid?.should be_true
    end

    it "should have an invalid configuration if key is missing" do
      request_handler.stub(:configuration).and_return({})
      request_handler.configuration_valid?.should be_false
    end

    it "should raise an error when verifying configuration if invalid" do
      request_handler.verify_configuration!
      request_handler.stub(:configuration_valid?).and_return(false)
      expect {
        request_handler.verify_configuration!
      }.to raise_error(Paperback::Errors::ConfigurationError)
    end
  end

  context "connection handling" do
    before(:all) do
      @fake_connection = PersonalAuthSpecConnection.new
    end

    it "should decorate a parameters object with key credentials" do
      parameters = {}
      request_handler.authenticate_connection(@fake_connection, parameters)
      parameters[:key].should eq("my_key")
    end

    it "should not tamper with other parameter keys" do
      parameters = {:tip => "top"}
      request_handler.authenticate_connection(@fake_connection, parameters)
      parameters[:key].should eq("my_key")
      parameters[:tip].should eq("top")
    end

    it "should not overwrite an existing key parameter, if it exists" do
      parameters = {:tip => "top", :key => "new_key"}
      request_handler.authenticate_connection(@fake_connection, parameters)
      parameters[:key].should eq("new_key")
      parameters[:tip].should eq("top")
    end
  end
end

class PersonalAuthSpecConnection
  attr_accessor :key
end
