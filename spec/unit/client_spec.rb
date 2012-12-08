require 'spec_helper'

describe Paperback::Client do
  context "initialization" do
    it "should be configurable" do
      client.key.should eq("my_key")
    end
  end

  context "requests" do
    it "should pass methods to request handler" do 
=begin
      expect {
        client.get
      }.to raise_error ArgumentError
=end
    end

    it "should respond to methods handled by request handler" do
=begin
      client.respond_to?(:get).should be_true
=end
    end
  end
end
